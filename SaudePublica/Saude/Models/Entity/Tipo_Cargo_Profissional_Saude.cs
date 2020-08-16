﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Saude.Models.Entity
{
	[Table("Tipo_Cargo_Profissional_Saude")]
	public class Tipo_Cargo_Profissional_Saude
	{
		public int Id { get; set; }

		[Required(ErrorMessage = "Nome é obrigatório")]
		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		public string Nome { get; set; }
	}
}
