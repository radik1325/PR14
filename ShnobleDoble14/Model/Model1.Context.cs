﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ShnobleDoble14.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GAIReestrDBEntities : DbContext
    {
        private static GAIReestrDBEntities _context { get; set; }
        public GAIReestrDBEntities()
            : base("name=GAIReestrDBEntities")
        {
        }

        public static GAIReestrDBEntities GetContext()
        {
            if(_context == null)
            {
                _context = new GAIReestrDBEntities();
            }
            return _context;
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Cars> Cars { get; set; }
        public virtual DbSet<Colors> Colors { get; set; }
        public virtual DbSet<Marks> Marks { get; set; }
        public virtual DbSet<Owners> Owners { get; set; }
    }
}
