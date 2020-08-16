using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Saude.Models.Enums;

namespace Saude.Models.ViewModel
{
	public class UsuarioViewModel
	{
		public int? Id { get; set; }

		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		[Required(ErrorMessage = "Login é obrigatório")]
		[RegularExpression(@"^[a-z0-9]*$", ErrorMessage = "Login deve conter apenas letras minúsculas e números")]
		public string Login { get; set; }

		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		[Required(ErrorMessage = "Senha é obrigatória")]
		public string Senha { get; set; }

		[MaxLength(45, ErrorMessage = "Campo deve conter no máximo 45 caracteres")]
		[RegularExpression(@"^[^@\s]+@[^@\s\.]+\.[^@\.\s]+$", ErrorMessage = "Favor informar um email válido")]
		public string Email { get; set; }

		[MaxLength(100, ErrorMessage = "Campo deve conter no máximo 100 caracteres")]
		[Required(ErrorMessage = "Nome é obrigatório")]
		[RegularExpression(@"^\D*$", ErrorMessage = "Nome deve possuir apenas letras e caracteres especiais")]
		public string Nome { get; set; }

		[StringLength(11, ErrorMessage = "Cpf deve conter apenas números e ter 11 dígitos")]
		[Required(ErrorMessage = "Cpf é obrigatório")]
		[Range(9999999999, 99999999999, ErrorMessage = "Cpf deve conter apenas números e ter 11 dígitos")]
		public string Cpf { get; set; }

		[DataType(DataType.Date)]
		[DisplayName("Data de nascimento")]
		[Required(ErrorMessage = "Data de nascimento é obrigatória")]
		public DateTime DataNascimento { get; set; }

		[DisplayName("Perfil de acesso")]
		[Required(ErrorMessage = "Perfil de acesso é obrigatório")]
		public PerfilAcessoEnum Perfil_Acesso_Id { get; set; }

		[DisplayName("Tipo de cargo do profissional de saúde")]
		public int? Tipo_Cargo_Profissional_Saude { get; set; }
	}
}
