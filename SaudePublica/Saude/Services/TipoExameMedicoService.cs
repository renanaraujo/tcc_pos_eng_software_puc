using System.Collections.Generic;
using System.Linq;
using Saude.Models.Context;
using Saude.Models.Entity;

namespace Saude.Services
{
	public class TipoExameMedicoService
	{
		private readonly SaudeDbContext _context;

		public TipoExameMedicoService(SaudeDbContext dbContext)
		{
			_context = dbContext;
		}
		public List<Tipo_Exame_Medico> GetAllTipoExameMedico()
		{
			return _context.TipoExameMedico.ToList();
		}

		public Tipo_Exame_Medico GetTipoExameMedico(int id)
		{
			return _context.TipoExameMedico.SingleOrDefault(x => x.Id == id);
		}

		public void AddTipoExameMedico(Tipo_Exame_Medico tipoExameMedico)
		{
			_context.Add(tipoExameMedico);
			_context.SaveChanges();
		}

		public void UpdateTipoExameMedico(Tipo_Exame_Medico tipoExameMedico)
		{
			_context.Update(tipoExameMedico);
			_context.SaveChanges();
		}

		public void DeleteTipoExameMedico(int id)
		{
			Tipo_Exame_Medico tipoExameMedico = _context.TipoExameMedico.Find(id);
			_context.TipoExameMedico.Remove(tipoExameMedico);
			_context.SaveChanges();
		}

		public bool ExistsTipoExameMedico(Tipo_Exame_Medico tipoExameMedico)
		{
			return _context.TipoExameMedico.Any(x => x.Nome == tipoExameMedico.Nome && x.Id != tipoExameMedico.Id);
		}
	}
}
