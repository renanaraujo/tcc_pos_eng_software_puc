using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Saude.Controllers.Attributes;
using Saude.Models.Context;
using Saude.Models.Entity;
using Saude.Models.Enums;
using Saude.Services;

namespace Saude.Controllers
{
	[AuthorizeByPerfil(PerfilAcessoEnum.Admin)]
	public class TipoExameMedicoController : Controller
	{
		private readonly TipoExameMedicoService _service;

		public TipoExameMedicoController(SaudeDbContext context)
		{
			_service = new TipoExameMedicoService(context);
		}

		// GET: TipoExameMedico
		public async Task<IActionResult> Index()
		{
			return View(_service.GetAllTipoExameMedico());
		}

		// GET: TipoExameMedico/Details/5
		public async Task<IActionResult> Details(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			Tipo_Exame_Medico tipoExameMedico = _service.GetTipoExameMedico(id.Value);
			if (tipoExameMedico == null)
			{
				return NotFound();
			}

			return View(tipoExameMedico);
		}

		// GET: TipoExameMedico/Create
		public IActionResult Create()
		{
			return View();
		}

		// POST: TipoExameMedico/Create
		// To protect from overposting attacks, enable the specific properties you want to bind to, for 
		// more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Create([Bind("Id,Nome,Descricao")] Tipo_Exame_Medico tipoExameMedico)
		{
			this.CustomValidationTipoExameMedico(tipoExameMedico);
			if (ModelState.IsValid)
			{
				_service.AddTipoExameMedico(tipoExameMedico);
				return RedirectToAction(nameof(Index));
			}

			return View(tipoExameMedico);
		}

		// GET: TipoExameMedico/Edit/5
		public async Task<IActionResult> Edit(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			Tipo_Exame_Medico tipoExameMedico = _service.GetTipoExameMedico(id.Value);
			if (tipoExameMedico == null)
			{
				return NotFound();
			}

			return View(tipoExameMedico);
		}

		// POST: TipoExameMedico/Edit/5
		// To protect from overposting attacks, enable the specific properties you want to bind to, for 
		// more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> Edit(int id, [Bind("Id,Nome,Descricao")] Tipo_Exame_Medico tipoExameMedico)
		{
			if (id != tipoExameMedico.Id)
			{
				return NotFound();
			}

			this.CustomValidationTipoExameMedico(tipoExameMedico);
			if (ModelState.IsValid)
			{
				_service.UpdateTipoExameMedico(tipoExameMedico);
				return RedirectToAction(nameof(Index));
			}

			return View(tipoExameMedico);
		}

		// GET: TipoExameMedico/Delete/5
		public async Task<IActionResult> Delete(int? id)
		{
			if (id == null)
			{
				return NotFound();
			}

			Tipo_Exame_Medico tipoExameMedico = _service.GetTipoExameMedico(id.Value);
			if (tipoExameMedico == null)
			{
				return NotFound();
			}

			return View(tipoExameMedico);
		}

		// POST: TipoExameMedico/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public async Task<IActionResult> DeleteConfirmed(int id)
		{
			_service.DeleteTipoExameMedico(id);
			return RedirectToAction(nameof(Index));
		}

		private void CustomValidationTipoExameMedico(Tipo_Exame_Medico tipoExameMedico)
		{
			if (_service.ExistsTipoExameMedico(tipoExameMedico))
			{
				ModelState.AddModelError("Tipo_Exame_Medico", "Já existe um tipo de exame médico cadastrado com esse nome.");
			}
		}
	}
}
