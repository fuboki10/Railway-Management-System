//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RailwaySystem
{
    using System;
    using System.Collections.Generic;
    
    public partial class Coach_Yard
    {
        public Coach_Yard()
        {
            this.Trains = new HashSet<Train>();
        }
    
        public int ID { get; set; }
        public int Station_ID { get; set; }
        public int Size { get; set; }
    
        public virtual Station Station { get; set; }
        public virtual ICollection<Train> Trains { get; set; }
    }
}
