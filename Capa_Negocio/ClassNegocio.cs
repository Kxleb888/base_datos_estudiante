using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using Capa_Datoos;
using Capa_Entidadd;

namespace Capa_Negocio
{
    public class ClassNegocio
    {
        ClassDatoos objd = new ClassDatoos();

        public DataTable N_listar_est()
        {
            return objd.D_listar_est();
        }

        public DataTable N_buscar_est(ClassEntidadd obje)
        {
            return objd.D_buscar_est(obje);
        }

        public String N_mantenimiento_est(ClassEntidadd obje)
        {
            return objd.D_mantenimiento_est(obje);
        }
    }
}
