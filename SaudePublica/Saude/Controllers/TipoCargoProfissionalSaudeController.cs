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
    public class TipoCargoProfissionalSaudeController : Controller
    {
        private readonly TipoCargoProfissionalSaudeService _service;

        public TipoCargoProfissionalSaudeController(SaudeDbContext context)
        {
            _service = new TipoCargoProfissionalSaudeService(context);
        }

        // GET: TipoCargoProfissionalSaude
        public async Task<IActionResult> Index()
        {
            return View(_service.GetAllTipoCargoProfissionalSaude());
        }

        // GET: TipoCargoProfissionalSaude/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude = _service.GetTipoCargoProfissionalSaude(id.Value);
            if (tipoCargoProfissionalSaude == null)
            {
                return NotFound();
            }

            return View(tipoCargoProfissionalSaude);
        }

        // GET: TipoCargoProfissionalSaude/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: TipoCargoProfissionalSaude/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Descricao")] Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude)
        {
            if (ModelState.IsValid)
            {
                _service.AddTipoCargoProfissionalSaude(tipoCargoProfissionalSaude);
                return RedirectToAction(nameof(Index));
            }
            return View(tipoCargoProfissionalSaude);
        }

        // GET: TipoCargoProfissionalSaude/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude = _service.GetTipoCargoProfissionalSaude(id.Value);
            if (tipoCargoProfissionalSaude == null)
            {
                return NotFound();
            }
            return View(tipoCargoProfissionalSaude);
        }

        // POST: TipoCargoProfissionalSaude/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nome,Descricao")] Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude)
        {
            if (id != tipoCargoProfissionalSaude.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _service.UpdateTipoCargoProfissionalSaude(tipoCargoProfissionalSaude);
                return RedirectToAction(nameof(Index));
            }
            return View(tipoCargoProfissionalSaude);
        }

        // GET: TipoCargoProfissionalSaude/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude = _service.GetTipoCargoProfissionalSaude(id.Value);
            if (tipoCargoProfissionalSaude == null)
            {
                return NotFound();
            }

            return View(tipoCargoProfissionalSaude);
        }

        // POST: TipoCargoProfissionalSaude/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            _service.DeleteTipoCargoProfissionalSaude(id);
            return RedirectToAction(nameof(Index));
        }
    }
}
