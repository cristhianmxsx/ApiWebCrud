using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

using WebApi.Models;
using WebApi.Data;

namespace WebApi.Controllers
{
    public class InstitucionController : ApiController
    {
        
        // LISTADO SDATOS API
        public List<Institucion> Get()
        {

            return InstitucionData.Listar();

        }



        // RETORNAR DATOS  API
        public Institucion Get(int id)
        {
            return InstitucionData.Obtener(id);
        }

       // REGISTRAR API
        public bool Post([FromBody]Institucion oInstitucion )
        {
            return InstitucionData.Registrar(oInstitucion);
        }

        // MODIFICAR  API
        public bool  Put([FromBody]Institucion oInstitucion)
        {
            return InstitucionData.Modificar(oInstitucion);
        }

   // DELETE  API
        public bool Delete(int id)
        {
            return InstitucionData.Eliminar(id);
        }
    }
}
