//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GestionDePermisos.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class MUNICIPALIDAD
    {
        public MUNICIPALIDAD()
        {
            this.UNIDAD = new HashSet<UNIDAD>();
        }
    
        public decimal IDMUNICIPALIDAD { get; set; }
        public string NOMBREMUNICIPALIDAD { get; set; }
        public string DIRECCION { get; set; }
        public Nullable<decimal> TELEFONO { get; set; }
        public string CORREO { get; set; }
        public Nullable<decimal> IDCOMUNA { get; set; }
    
        public virtual COMUNA COMUNA { get; set; }
        public virtual ICollection<UNIDAD> UNIDAD { get; set; }
    }
}
