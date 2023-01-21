using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApi.Models;

using System.Data.SqlClient;
using System.Data;

namespace WebApi.Data
{
    public class InstitucionData
    {



        public static List<Institucion> Listar()

        {
            //  CRUD  MANTENIMIENTO

            List<Institucion> oListadoInstitucion = new List<Institucion>();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {


                SqlCommand cmd = new SqlCommand("listado", oConexion);


                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())

                    {
                      while(dr.Read())

                        {
                            oListadoInstitucion.Add(new Institucion()

                            {

                                Institucion_cod = Convert.ToInt32(dr["Institucion_cod"]),

                                inst_nombre = dr["inst_nombre"].ToString(),
                                inst_tipoinstitucion = dr["inst_tipoinstitucion"].ToString(),

                                inst_estado = dr["inst_estado"].ToString(),

                            });

                        }

                    }

                    return oListadoInstitucion;



                }
                catch(Exception ex)
                {
                    return oListadoInstitucion;
                }

            }

        }

        //*****


        public static  Institucion Obtener(int idInstitucion)

        {
            Institucion oInstitucion = new Institucion();

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {


                SqlCommand cmd = new SqlCommand("retornar", oConexion);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Institucion_cod", idInstitucion);

                try
                {
                    oConexion.Open();
                    

                    using (SqlDataReader dr = cmd.ExecuteReader())

                    {
                        while (dr.Read())

                        {
                            oInstitucion= new Institucion()

                            {

                                Institucion_cod = Convert.ToInt32(dr["Institucion_cod"]),

                                inst_nombre = dr["inst_nombre"].ToString(),
                                inst_tipoinstitucion = dr["inst_tipoinstitucion"].ToString(),

                                inst_estado = dr["inst_estado"].ToString(),

                            };

                        }

                    }

                    return oInstitucion;



                }
                catch (Exception ex)
                {
                    return oInstitucion;
                }

            }

        }
        //******

        public static bool Registrar(Institucion oInstitucion)

        {
         
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {


                SqlCommand cmd = new SqlCommand("REGISTRAR", oConexion);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Institucion_cod", oInstitucion.Institucion_cod);

                cmd.Parameters.AddWithValue("@inst_nombre", oInstitucion.inst_nombre);

                cmd.Parameters.AddWithValue("@inst_tipoinstitucion", oInstitucion.inst_tipoinstitucion);
                cmd.Parameters.AddWithValue("@inst_estado", oInstitucion.inst_estado);

                try
                {

                    oConexion.Open();

                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
            {
                return false;
            }

        }

        }


        //******

        public static bool Modificar(Institucion oInstitucion)

        {

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {


                SqlCommand cmd = new SqlCommand("MODIFICAR", oConexion);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Institucion_cod", oInstitucion.Institucion_cod);

                cmd.Parameters.AddWithValue("@inst_nombre", oInstitucion.inst_nombre);

                cmd.Parameters.AddWithValue("@inst_tipoinstitucion", oInstitucion.inst_tipoinstitucion);
                cmd.Parameters.AddWithValue("@inst_estado", oInstitucion.inst_estado);

                try
                {

                    oConexion.Open();

                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }

            }

        }


        //******

        public static bool Eliminar(int id)

        {

            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {


                SqlCommand cmd = new SqlCommand("ELIMINAR", oConexion);


                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Institucion_cod", id);

             
                try
                {

                    oConexion.Open();

                    cmd.ExecuteNonQuery();
                    return true;

                }
                catch (Exception ex)
                {
                    return false;
                }

            }

        }
    }


}