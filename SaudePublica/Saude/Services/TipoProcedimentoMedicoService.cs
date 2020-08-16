using System.Collections.Generic;
using System.Linq;
using Saude.Models.Context;
using Saude.Models.Entity;

namespace Saude.Services
{
	public class TipoProcedimentoMedicoService
	{
		private readonly SaudeDbContext _context;

		public TipoProcedimentoMedicoService(SaudeDbContext dbContext)
		{
			_context = dbContext;
		}
		public List<Tipo_Procedimento_Medico> GetAllTipoProcedimentoMedico()
		{
			return _context.TipoProcedimentoMedico.ToList();
		}

		public Tipo_Procedimento_Medico GetTipoProcedimentoMedico(int id)
		{
			return _context.TipoProcedimentoMedico.SingleOrDefault(x => x.Id == id);
		}

		public void AddTipoProcedimentoMedico(Tipo_Procedimento_Medico tipoProcedimentoMedico)
		{
			_context.Add(tipoProcedimentoMedico);
			_context.SaveChanges();
		}

		public void UpdateTipoProcedimentoMedico(Tipo_Procedimento_Medico tipoProcedimentoMedico)
		{
			_context.Update(tipoProcedimentoMedico);
			_context.SaveChanges();
		}

		public void DeleteTipoProcedimentoMedico(int id)
		{
			Tipo_Procedimento_Medico tipoProcedimentoMedico = _context.TipoProcedimentoMedico.Find(id);
			_context.TipoProcedimentoMedico.Remove(tipoProcedimentoMedico);
			_context.SaveChanges();
		}

		public bool ExistsTipoProcedimentoMedico(Tipo_Procedimento_Medico tipoProcedimentoMedico)
		{
			return _context.TipoProcedimentoMedico.Any(x => x.Nome == tipoProcedimentoMedico.Nome && x.Id != tipoProcedimentoMedico.Id);
		}
	}
}
