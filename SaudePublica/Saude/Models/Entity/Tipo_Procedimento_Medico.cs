using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saude.Models.Entity
{
	[Table("Tipo_Procedimento_Medico")]
	public class Tipo_Procedimento_Medico
	{
		public int Id { get; set; }

		[Required(ErrorMessage = "Nome é obrigatório")]
		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		public string Nome { get; set; }

		[DisplayName("Descrição")]
		[MaxLength(500)]
		[Required(ErrorMessage = "Descrição é obrigatória")]
		public string Descricao { get; set; }
	}
}
