using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Saude.Controllers.Attributes;
using Saude.Models.Context;
using Saude.Models.Entity;
using Saude.Models.Enums;
using Saude.Models.ViewModel;
using Saude.Services;

namespace Saude.Controllers
{
	[AuthorizeByPerfil(PerfilAcessoEnum.Admin, PerfilAcessoEnum.Paciente)]
    public class UsuarioController : Controller
    {
        private readonly UsuarioService _usuarioService;
        private readonly PerfilAcessoService _perfilAcessoService;
        private readonly TipoCargoProfissionalSaudeService _tipoCargoProfissionalSaudeService;

        public UsuarioController(SaudeDbContext context)
        {
            _usuarioService = new UsuarioService(context);
            _perfilAcessoService = new PerfilAcessoService(context);
            _tipoCargoProfissionalSaudeService = new TipoCargoProfissionalSaudeService(context);
        }

        // GET: Usuario
        public async Task<IActionResult> Index()
        {
            return View(_usuarioService.GetAllUsuarioList());
        }

        // GET: Usuario/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var usuario = _usuarioService.GetUsuario(id.Value);
            if (usuario == null)
            {
                return NotFound();
            }

            UsuarioViewModel viewModel = _usuarioService.UsuarioToViewModel(usuario);
            return View(viewModel);
        }

        // GET: Usuario/Create
        public IActionResult Create()
        {
	        this.SetDropdownListToViewBag();
            return View();
        }

        // POST: Usuario/Create
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(UsuarioViewModel usuario)
        {
	        this.CustomValidationUsuarioViewModel(usuario);
	        if (ModelState.IsValid)
	        {
		        _usuarioService.CreateUsuario(usuario);

                if(((ClaimsIdentity)User.Identity).HasClaim(ClaimTypes.Role, ((int)PerfilAcessoEnum.Admin).ToString()))
                {
	                return RedirectToAction("Index");
                }

                string message = $"Login {usuario.Login} criado com sucesso. Utilize a seção de login para entrar no sistema.";
                return RedirectToAction("Index", "Home", new { Message = message });
	        }

	        this.SetDropdownListToViewBag();
	        return View(usuario);
        }

        [AllowAnonymous]
        // GET: Usuario/Register
        public IActionResult Register([Bind("Nome,Login")] UsuarioViewModel usuario)
        {
	        this.SetDropdownListToViewBag();
            ModelState.Clear();
            return View(nameof(Create), usuario);
        }

        // GET: Usuario/CreateAdmin
        public IActionResult CreateAdmin()
        {
	        return View();
        }

        // POST: Usuario/CreateAdmin
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateAdmin([Bind("Login,Senha")] Usuario usuario)
        {
	        this.CustomValidationUsuarioAdmin(usuario);
	        if (ModelState.IsValid)
	        {
		        _usuarioService.CreateUsuarioAdmin(usuario);
		        return RedirectToAction(nameof(Index));
	        }

	        return View(usuario);
        }


        // GET: Usuario/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
	        if (id == null)
	        {
		        return NotFound();
	        }

	        Usuario usuario = _usuarioService.GetUsuario(id.Value);
	        if (usuario == null)
	        {
		        return NotFound();
	        }

	        UsuarioViewModel viewModel = _usuarioService.UsuarioToViewModel(usuario);
	        this.SetDropdownListToViewBag();

	        return View(viewModel);
        }

        // POST: Usuario/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, UsuarioViewModel usuario)
        {
            if (id != usuario.Id)
            {
                return NotFound();
            }

            this.CustomValidationUsuarioViewModel(usuario);
            if (ModelState.IsValid)
            {
                _usuarioService.UpdateUsuario(usuario);
                return RedirectToAction(nameof(Index));
            }

            this.SetDropdownListToViewBag();
            return View(usuario);
        }

        // GET: Usuario/EditAdmin/5
        public async Task<IActionResult> EditAdmin(int? id)
        {
	        if (id == null)
	        {
		        return NotFound();
	        }

	        Usuario usuario = _usuarioService.GetUsuario(id.Value);
	        if (usuario == null)
	        {
		        return NotFound();
	        }

	        return View(usuario);
        }

        // POST: Usuario/EditAdmin/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditAdmin(int id, Usuario usuario)
        {
	        if (id != usuario.Id)
	        {
		        return NotFound();
	        }

	        this.CustomValidationUsuarioAdmin(usuario);
	        if (ModelState.IsValid)
	        {
		        _usuarioService.UpdateUsuarioAdmin(usuario);
		        return RedirectToAction(nameof(Index));
	        }

	        this.SetDropdownListToViewBag();
	        return View(usuario);
        }

        // GET: Usuario/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Usuario usuario = _usuarioService.GetUsuario(id.Value);
            if (usuario == null)
            {
                return NotFound();
            }

            return View(_usuarioService.UsuarioToViewModel(usuario));
        }

        // POST: Usuario/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
			_usuarioService.DeleteUsuario(id);
            return RedirectToAction(nameof(Index));
        }

        private void SetDropdownListToViewBag()
        {
	        ViewBag.PerfilAcessoList = _perfilAcessoService.GetAllPerfilAcessoAllowedForRegister().Select(x =>
		        new SelectListItem
		        {
			        Text = x.Nome,
			        Value = x.Id.ToString()
		        }).ToList();

	        ViewBag.TipoCargoProfissionalSaudeList = _tipoCargoProfissionalSaudeService.GetAllTipoCargoProfissionalSaude()
		        .Select(x => new SelectListItem
		        {
			        Text = x.Nome,
			        Value = x.Id.ToString()
		        }).ToList();
        }


        private void CustomValidationUsuarioViewModel(UsuarioViewModel usuario)
        {
	        if (usuario.Perfil_Acesso_Id == PerfilAcessoEnum.ProfissionalSaude &&
	            usuario.Tipo_Cargo_Profissional_Saude.HasValue == false)
	        {
		        ModelState.AddModelError("Tipo_Cargo_Profissional_Saude",
			        "Tipo de cargo do profissional de saúde é obrigatório para esse perfil.");
	        }

	        if (_usuarioService.ExisteOutroUsuarioJaCadastrado(usuario))
	        {
		        ModelState.AddModelError("Model",
			        "Login ou Cpf já cadastrados, por favor verifique os campos de cadastro ou efetue login com suas credenciais.");
	        }
        }

        private void CustomValidationUsuarioAdmin(Usuario usuario)
        {
	        if (_usuarioService.ExisteMesmoLoginJaCadastrado(usuario))
	        {
		        ModelState.AddModelError("Model", "Login já em uso. Favor escolher um outro login");
	        }
        }

    }
}
