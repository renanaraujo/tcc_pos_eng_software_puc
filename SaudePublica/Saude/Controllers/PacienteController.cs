using Microsoft.AspNetCore.Mvc;
using Saude.Controllers.Attributes;
using Saude.Models.Enums;

namespace Saude.Controllers
{
	[AuthorizeByPerfil(PerfilAcessoEnum.Admin, PerfilAcessoEnum.Paciente)]
	public class PacienteController : Controller
	{
		public IActionResult AreaPaciente()
		{
			return View();
		}
	}
}
