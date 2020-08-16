using System.Collections.Generic;
using System.Linq;
using Saude.Models.Context;
using Saude.Models.Entity;
using Saude.Models.Enums;
using Saude.Models.ViewModel;

namespace Saude.Services
{
	public class UsuarioService
	{
		private readonly SaudeDbContext _context;

		public UsuarioService(SaudeDbContext dbContext)
		{
			_context = dbContext;
		}

		public List<UsuarioViewModel> GetAllUsuarioList()
		{
			return _context.Usuario.ToList().Select(this.UsuarioToViewModel).ToList();
		}

		public Usuario GetUsuario(int id)
		{
			return  _context.Usuario.SingleOrDefault(x => x.Id == id);
		}

		public Paciente GetPaciente(int id)
		{
			return _context.Paciente.SingleOrDefault(x => x.Id == id);
		}

		public Profissional_Saude GetProfissionalSaude(int id)
		{
			return _context.ProfissionalSaude.SingleOrDefault(x => x.Id == id);
		}

		public UsuarioViewModel UsuarioToViewModel(Usuario usuario)
		{
			var viewModel = new UsuarioViewModel
			{
				Login = usuario.Login,
				Senha = usuario.Senha,
				Email = usuario.Email,
				Id = usuario.Id,
				Perfil_Acesso_Id = (PerfilAcessoEnum)usuario.Perfil_Acesso_Id
			};

			if (usuario.Perfil_Acesso_Id == (int)PerfilAcessoEnum.Paciente)
			{
				Paciente paciente = this.GetPaciente(usuario.Id);
				viewModel.Cpf = paciente.Cpf;
				viewModel.Nome = paciente.Nome;
				viewModel.DataNascimento = paciente.Data_Nascimento;
			}
			else if (usuario.Perfil_Acesso_Id == (int)PerfilAcessoEnum.ProfissionalSaude)
			{
				var profissionalSaude = this.GetProfissionalSaude(usuario.Id);
				viewModel.Cpf = profissionalSaude.Cpf;
				viewModel.Nome = profissionalSaude.Nome;
				viewModel.DataNascimento = profissionalSaude.Data_Nascimento;
				viewModel.Tipo_Cargo_Profissional_Saude = profissionalSaude.Tipo_Cargo_Profissional_Saude_Id;
			}

			return viewModel;
		}

		public void UpdateUsuario(UsuarioViewModel viewModel)
		{
			var usuario = _context.Usuario.Find(viewModel.Id.Value);

			usuario.Login = viewModel.Login;
			usuario.Senha = viewModel.Senha;
			usuario.Email = viewModel.Email;
			usuario.Perfil_Acesso_Id = (int) viewModel.Perfil_Acesso_Id;

			_context.Update(usuario);
			_context.SaveChanges();

			if (usuario.Perfil_Acesso_Id == (int)PerfilAcessoEnum.Paciente)
			{
				Paciente paciente = _context.Paciente.Find(viewModel.Id.Value);
				paciente.Nome = viewModel.Nome;
				paciente.Cpf = viewModel.Cpf;
				paciente.Data_Nascimento = viewModel.DataNascimento;
				_context.Paciente.Update(paciente);
				_context.SaveChanges();
			}
			else if (usuario.Perfil_Acesso_Id == (int) PerfilAcessoEnum.ProfissionalSaude)
			{
				Profissional_Saude profissionalSaude = _context.ProfissionalSaude.Find(viewModel.Id.Value);

				profissionalSaude.Nome = viewModel.Nome;
				profissionalSaude.Cpf = viewModel.Cpf;
				profissionalSaude.Data_Nascimento = viewModel.DataNascimento;
				profissionalSaude.Tipo_Cargo_Profissional_Saude_Id = viewModel.Tipo_Cargo_Profissional_Saude.Value;

				_context.ProfissionalSaude.Update(profissionalSaude);
				_context.SaveChanges();
			}
		}

		public void DeleteUsuario(int id)
		{
			Usuario usuario = _context.Usuario.Find(id);

			if (usuario.Perfil_Acesso_Id == (int)PerfilAcessoEnum.Paciente)
			{
				Paciente paciente = _context.Paciente.Find(id);
				_context.Paciente.Remove(paciente);
				_context.SaveChanges();
			}
			else if (usuario.Perfil_Acesso_Id == (int)PerfilAcessoEnum.ProfissionalSaude)
			{
				Profissional_Saude profissionalSaude = _context.ProfissionalSaude.Find(id);
				_context.ProfissionalSaude.Remove(profissionalSaude);
				_context.SaveChanges();
			}
			_context.Usuario.Remove(usuario);
			_context.SaveChanges();
		}

		public bool ExisteOutroUsuarioJaCadastrado(UsuarioViewModel viewModel)
		{
			return
				_context.Usuario.Any(x => x.Login.ToLower() == viewModel.Login.ToLower() && x.Id != viewModel.Id)
				|| _context.Paciente.Any(x => x.Cpf == viewModel.Cpf && x.Id != viewModel.Id)
				|| _context.ProfissionalSaude.Any(x => x.Cpf == viewModel.Cpf && x.Id != viewModel.Id);
		}

		public void CreateUsuario(UsuarioViewModel viewModel)
		{
			var usuario = new Usuario
			{
				Login = viewModel.Login,
				Senha = viewModel.Senha,
				Email = viewModel.Email,
				Perfil_Acesso_Id = (int)viewModel.Perfil_Acesso_Id
			};

			_context.Add(usuario);
			_context.SaveChanges();

			if (viewModel.Perfil_Acesso_Id == PerfilAcessoEnum.ProfissionalSaude)
			{
				var profissionalSaude = new Profissional_Saude
				{
					Id = usuario.Id,
					Nome = viewModel.Nome,
					Cpf = viewModel.Cpf,
					Data_Nascimento = viewModel.DataNascimento,
					Tipo_Cargo_Profissional_Saude_Id = viewModel.Tipo_Cargo_Profissional_Saude.Value
				};
				_context.ProfissionalSaude.Add(profissionalSaude);
			}
			else if (viewModel.Perfil_Acesso_Id == PerfilAcessoEnum.Paciente)
			{
				var paciente = new Paciente
				{
					Id = usuario.Id,
					Nome = viewModel.Nome,
					Cpf = viewModel.Cpf,
					Data_Nascimento = viewModel.DataNascimento
				};
				_context.Paciente.Add(paciente);
			}
			_context.SaveChanges();
		}

		public void CreateUsuarioAdmin(Usuario usuario)
		{
			usuario.Perfil_Acesso_Id = (int) PerfilAcessoEnum.Admin;
			_context.Usuario.Add(usuario);
			_context.SaveChanges();
		}

		public void UpdateUsuarioAdmin(Usuario usuario)
		{
			usuario.Perfil_Acesso_Id = (int)PerfilAcessoEnum.Admin;
			_context.Usuario.Update(usuario);
			_context.SaveChanges();
		}

		public bool ExisteMesmoLoginJaCadastrado(Usuario usuario)
		{
			return _context.Usuario.Any(x => x.Login.ToLower() == usuario.Login.ToLower() && x.Id != usuario.Id);
		}

		public Usuario CheckLogin(Usuario usuario)
		{
			return _context.Usuario.SingleOrDefault(x => x.Login == usuario.Login && x.Senha == usuario.Senha);
		}
	}
}
