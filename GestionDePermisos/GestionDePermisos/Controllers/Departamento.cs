using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GestionDePermisos.Data;

namespace GestionDePermisos.Controllers
{
    public class Departamento
    {
        public int idDepartamento { get; set; }
        public string nombreDepartamento { get; set; }
        public int idUnidad { get; set; }
        public IList<Departamento> departamentos {get;set; }

        public Departamento()
        {
            idDepartamento = default(int);
            nombreDepartamento = string.Empty;
            idUnidad = default(int);
        }

        public bool readAll()
        {
            try
            {
                this.departamentos = new List<Departamento>();
                foreach (var item in Conexion.entities.DEPARTAMENTO.ToList())
                {
                    Departamento nuevo = new Departamento();
                    nuevo.idDepartamento = Convert.ToInt32(item.IDDEPARTAMENTO);
                    nuevo.nombreDepartamento = item.NOMBREDEPARTAMENTO;
                    nuevo.idUnidad = Convert.ToInt32(item.IDUNIDAD);

                    this.departamentos.Add(nuevo);
                }
                return true;
            }
            catch (Exception e)
            {

                return false;
            }
        }
    }
}