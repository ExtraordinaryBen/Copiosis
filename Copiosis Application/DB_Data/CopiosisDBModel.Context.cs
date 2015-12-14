﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Copiosis_Application.DB_Data
{
	using System;
	using System.Data.Entity;
	using System.Data.Entity.Infrastructure;
	using System.Data.Entity.Validation;
    using System.Linq;
	
	public partial class CopiosisEntities : DbContext
	{
		public CopiosisEntities()
			: base("name=CopiosisEntities")
		{
		}
	
		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			throw new UnintentionalCodeFirstException();
		}
	
		public virtual DbSet<itemClass> itemClasses { get; set; }
		public virtual DbSet<location> locations { get; set; }
		public virtual DbSet<product> products { get; set; }
		public virtual DbSet<transaction> transactions { get; set; }
		public virtual DbSet<user> users { get; set; }
		public virtual DbSet<webpages_Roles> webpages_Roles { get; set; }


		/*  Credit to StackOverFlow user Martin Devillers for providing a method to output
		cleaner error messages: http://stackoverflow.com/a/15820506 */
		public override int SaveChanges()
		{
			try
			{
				return base.SaveChanges();
			}
			catch (DbEntityValidationException ex)
			{
				// Retrieve the error messages as a list of strings.
				var errorMessages = ex.EntityValidationErrors
						.SelectMany(x => x.ValidationErrors)
						.Select(x => x.ErrorMessage);

				// Join the list to a single string.
				var fullErrorMessage = string.Join("; ", errorMessages);

				// Combine the original exception message with the new one.
				var exceptionMessage = string.Concat(ex.Message, " The validation errors are: ", fullErrorMessage);

				// Throw a new DbEntityValidationException with the improved exception message.
				throw new DbEntityValidationException(exceptionMessage, ex.EntityValidationErrors);
			}
		}



	}
	
}
