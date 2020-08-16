using System.Collections.Generic;
using System.Linq;
using Saude.Models.Context;
using Saude.Models.Entity;

namespace Saude.Services
{

	public class TipoCargoProfissionalSaudeService
	{
		private readonly SaudeDbContext _context;

		public TipoCargoProfissionalSaudeService(SaudeDbContext dbContext)
		{
			_context = dbContext;
		}
		public List<Tipo_Cargo_Profissional_Saude> GetAllTipoCargoProfissionalSaude()
		{
			return _context.TipoCargoProfissionalSaude.ToList();
		}

		public Tipo_Cargo_Profissional_Saude GetTipoCargoProfissionalSaude(int id)
		{
			return _context.TipoCargoProfissionalSaude.SingleOrDefault(x => x.Id == id);
		}

		public void AddTipoCargoProfissionalSaude(Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude)
		{
			_context.Add(tipoCargoProfissionalSaude);
			_context.SaveChanges();
		}

		public void UpdateTipoCargoProfissionalSaude(Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude)
		{
			_context.Update(tipoCargoProfissionalSaude);
			_context.SaveChanges();
		}

		public void DeleteTipoCargoProfissionalSaude(int id)
		{
			Tipo_Cargo_Profissional_Saude tipoCargoProfissionalSaude = _context.TipoCargoProfissionalSaude.Find(id);
			_context.TipoCargoProfissionalSaude.Remove(tipoCargoProfissionalSaude);
			_context.SaveChanges();
		}
	}
}
