using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saude.Models.Entity
{
	[Table("Paciente")]
	public class Paciente
	{
		public int Id { get; set; }

		[StringLength(11, ErrorMessage = "Cpf deve conter apenas números e ter 11 dígitos")]
		[Required(ErrorMessage = "Cpf é obrigatório")]
		[Range(9999999999, 99999999999, ErrorMessage = "Cpf deve conter apenas números e ter 11 dígitos")]
		public string Cpf { get; set; }

		[MaxLength(100)]
		[Required(ErrorMessage = "Nome é obrigatório")]
		public string Nome { get; set; }

		[DataType(DataType.Date)]
		[DisplayName("Data de nascimento")]
		[Required(ErrorMessage = "Data de nascimento é obrigatória")]
		public DateTime Data_Nascimento { get; set; }
	}
}
