using System.Collections.Generic;
using System.Linq;
using Saude.Models.Context;
using Saude.Models.Entity;

namespace Saude.Services
{
	public class PerfilAcessoService
	{
		private readonly SaudeDbContext _context;

		public PerfilAcessoService(SaudeDbContext dbContext)
		{
			_context = dbContext;
		}

		public List<Perfil_Acesso> GetAllPerfilAcesso()
		{
			return _context.PerfilAcesso.ToList();
		}

		public List<Perfil_Acesso> GetAllPerfilAcessoAllowedForRegister()
		{
			return this.GetAllPerfilAcesso().Where(x => x.Nome != "Admin").ToList();
		}

		public Perfil_Acesso GetPerfilAcesso(int id)
		{
			return _context.PerfilAcesso.SingleOrDefault(x => x.Id == id);
		}

		public void AddPerfilAcesso(Perfil_Acesso perfilAcesso)
		{
			_context.Add(perfilAcesso);
			_context.SaveChanges();
		}

		public void UpdatePerfilAcesso(Perfil_Acesso perfilAcesso)
		{
			_context.Update(perfilAcesso);
			_context.SaveChanges();
		}

		public void DeletePerfilAcesso(int id)
		{
			Perfil_Acesso perfilAcesso = _context.PerfilAcesso.Find(id);
			_context.PerfilAcesso.Remove(perfilAcesso);
			_context.SaveChanges();
		}
	}
}
