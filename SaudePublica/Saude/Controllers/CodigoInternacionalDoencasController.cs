using System.IO;
using Microsoft.AspNetCore.Mvc;
using Saude.Controllers.Attributes;
using Saude.Models.Enums;
using Saude.Services;

namespace Saude.Controllers
{
	[AuthorizeByPerfil(PerfilAcessoEnum.Admin, PerfilAcessoEnum.ProfissionalSaude)]
	public class CodigoInternacionalDoencasController : Controller
	{
		private readonly CodigoInternacionalDoencasService _service;
		public CodigoInternacionalDoencasController()
		{
			_service = new CodigoInternacionalDoencasService();
		}

		public IActionResult Index()
		{
			return View();
		}

		public IActionResult Get()
		{
			FileStream stream = _service.GetCodigoInternacionalDoencas();
			return File(stream, "application/octet-stream", fileDownloadName: "codigoInternacionalDoencas.pdf");
		}
	}
}
