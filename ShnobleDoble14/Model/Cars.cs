//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Cars
    {
        public int Id { get; set; }
        public string NumberPlate { get; set; }
        public int RegionPlate { get; set; }
        public int MarkId { get; set; }
        public int ColorId { get; set; }
        public int ProductionYear { get; set; }
        public int OwnerId { get; set; }
    
        public virtual Colors Colors { get; set; }
        public virtual Marks Marks { get; set; }
        public virtual Owners Owners { get; set; }
    }
}