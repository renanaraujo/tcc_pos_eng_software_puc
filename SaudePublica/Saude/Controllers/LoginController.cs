using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Saude.Models.Context;
using Saude.Models.Entity;
using Saude.Services;

namespace Saude.Controllers
{
	[AllowAnonymous]
	public class LoginController : Controller
	{
		private readonly UsuarioService _usuarioService;

		public LoginController(SaudeDbContext context)
		{
			_usuarioService = new UsuarioService(context);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Login(Usuario usuario)
		{
			Usuario usuarioLoggedIn =_usuarioService.CheckLogin(usuario);

			if (usuarioLoggedIn == null)
			{
				return RedirectToAction("Index", "Home", new{ Message = "Login ou senha inválidos."});
			}

			var claims = new List<Claim>
			{
				new Claim(ClaimTypes.Name, usuarioLoggedIn.Login),
				new Claim(ClaimTypes.Role, usuarioLoggedIn.Perfil_Acesso_Id.ToString())
			};

			var identidadeDeUsuario = new ClaimsIdentity(claims, "Login");
			ClaimsPrincipal claimPrincipal = new ClaimsPrincipal(identidadeDeUsuario);

			var propriedadesDeAutenticacao = new AuthenticationProperties
			{
				AllowRefresh = true,
				ExpiresUtc = DateTime.Now.ToLocalTime().AddHours(2),
				IsPersistent = true
			};

			await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimPrincipal, propriedadesDeAutenticacao);
			return RedirectToAction("Index", "Home");
		}

		public async Task<IActionResult> Logout()
		{
			await HttpContext.SignOutAsync();
			return RedirectToAction("Index", "Home");
		}

	}
}
