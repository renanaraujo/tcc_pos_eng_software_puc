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
    public class PerfilAcessoController : Controller
    {
        private readonly PerfilAcessoService _perfilAcessoService;

        public PerfilAcessoController(SaudeDbContext context)
        {
            _perfilAcessoService = new PerfilAcessoService(context);
        }

        // GET: PerfilAcesso
        public async Task<IActionResult> Index()
        {
            return View(_perfilAcessoService.GetAllPerfilAcesso());
        }

        // GET: PerfilAcesso/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Perfil_Acesso perfil_Acesso = _perfilAcessoService.GetPerfilAcesso(id.Value);
            if (perfil_Acesso == null)
            {
                return NotFound();
            }

            return View(perfil_Acesso);
        }

        // GET: PerfilAcesso/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: PerfilAcesso/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome")] Perfil_Acesso perfil_Acesso)
        {
            if (ModelState.IsValid)
            {
                _perfilAcessoService.AddPerfilAcesso(perfil_Acesso);
                return RedirectToAction(nameof(Index));
            }
            return View(perfil_Acesso);
        }

        // GET: PerfilAcesso/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var perfil_Acesso = _perfilAcessoService.GetPerfilAcesso(id.Value) ;
            if (perfil_Acesso == null)
            {
                return NotFound();
            }
            return View(perfil_Acesso);
        }

        // POST: PerfilAcesso/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nome")] Perfil_Acesso perfil_Acesso)
        {
            if (id != perfil_Acesso.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _perfilAcessoService.UpdatePerfilAcesso(perfil_Acesso);
                return RedirectToAction(nameof(Index));
            }
            return View(perfil_Acesso);
        }

        // GET: PerfilAcesso/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Perfil_Acesso perfil_Acesso = _perfilAcessoService.GetPerfilAcesso(id.Value);
            if (perfil_Acesso == null)
            {
                return NotFound();
            }

            return View(perfil_Acesso);
        }

        // POST: PerfilAcesso/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            _perfilAcessoService.DeletePerfilAcesso(id);
            return RedirectToAction(nameof(Index));
        }
    }

}
