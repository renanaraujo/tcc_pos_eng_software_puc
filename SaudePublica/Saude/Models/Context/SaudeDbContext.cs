using Microsoft.EntityFrameworkCore;
using Saude.Models.Entity;

namespace Saude.Models.Context
{
	public class SaudeDbContext : DbContext
	{
		public SaudeDbContext(DbContextOptions<SaudeDbContext> options) : base(options)
		{
		}

		public DbSet<Perfil_Acesso> PerfilAcesso { get; set; }
		public DbSet<Usuario> Usuario { get; set; }
		public DbSet<Tipo_Exame_Medico> TipoExameMedico { get; set; }
		public DbSet<Tipo_Procedimento_Medico> TipoProcedimentoMedico { get; set; }
		public DbSet<Paciente> Paciente { get; set; }
		public DbSet<Profissional_Saude> ProfissionalSaude { get; set; }
		public DbSet<Tipo_Cargo_Profissional_Saude> TipoCargoProfissionalSaude { get; set; }
	}
}
