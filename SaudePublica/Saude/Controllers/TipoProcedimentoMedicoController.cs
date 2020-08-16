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
    public class TipoProcedimentoMedicoController : Controller
    {
        private readonly TipoProcedimentoMedicoService _service;

        public TipoProcedimentoMedicoController(SaudeDbContext context)
        {
	        _service = new TipoProcedimentoMedicoService(context);
        }

        // GET: TipoProcedimentoMedico
        public async Task<IActionResult> Index()
        {
            return View(_service.GetAllTipoProcedimentoMedico());
        }

        // GET: TipoProcedimentoMedico/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Procedimento_Medico tipoProcedimentoMedico = _service.GetTipoProcedimentoMedico(id.Value);
            if (tipoProcedimentoMedico == null)
            {
                return NotFound();
            }

            return View(tipoProcedimentoMedico);
        }

        // GET: TipoProcedimentoMedico/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TipoProcedimentoMedico/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Descricao")] Tipo_Procedimento_Medico tipoProcedimentoMedico)
        {
	        this.CustomValidationTipoProcedimentoMedico(tipoProcedimentoMedico);
            if (ModelState.IsValid)
            {
                _service.AddTipoProcedimentoMedico(tipoProcedimentoMedico);
                return RedirectToAction(nameof(Index));
            }
            return View(tipoProcedimentoMedico);
        }

        // GET: TipoProcedimentoMedico/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Procedimento_Medico tipoProcedimentoMedico = _service.GetTipoProcedimentoMedico(id.Value);
            if (tipoProcedimentoMedico == null)
            {
                return NotFound();
            }
            return View(tipoProcedimentoMedico);
        }

        // POST: TipoProcedimentoMedico/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nome,Descricao")] Tipo_Procedimento_Medico tipoProcedimentoMedico)
        {
            if (id != tipoProcedimentoMedico.Id)
            {
                return NotFound();
            }

            this.CustomValidationTipoProcedimentoMedico(tipoProcedimentoMedico);
            if (ModelState.IsValid)
            {
                _service.UpdateTipoProcedimentoMedico(tipoProcedimentoMedico);
                return RedirectToAction(nameof(Index));
            }
            return View(tipoProcedimentoMedico);
        }

        // GET: TipoProcedimentoMedico/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Procedimento_Medico tipoProcedimentoMedico = _service.GetTipoProcedimentoMedico(id.Value);
            if (tipoProcedimentoMedico == null)
            {
                return NotFound();
            }

            return View(tipoProcedimentoMedico);
        }

        // POST: TipoProcedimentoMedico/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            _service.DeleteTipoProcedimentoMedico(id);
            return RedirectToAction(nameof(Index));
        }

        private void CustomValidationTipoProcedimentoMedico(Tipo_Procedimento_Medico tipoProcedimentoMedico)
        {
	        if (_service.ExistsTipoProcedimentoMedico(tipoProcedimentoMedico))
	        {
		        ModelState.AddModelError("Tipo_Procedimento_Medico", "Já existe um tipo de procedimento médico cadastrado com esse nome.");
	        }
        }
    }
}
