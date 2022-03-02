﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DigiProc.Models.Domain
{
    [Table("RequisitionType")]
    public partial class RequisitionType
    {
        /// <summary>
        /// primary key for the requisition
        /// </summary>
        [Key]
        [Column("RequisitionID")]
        public int RequisitionId { get; set; }
        /// <summary>
        /// the type of requisition
        /// </summary>
        [Column("RequisitionType")]
        [StringLength(50)]
        [Unicode(false)]
        public string RequisitionType1 { get; set; }
        /// <summary>
        /// the description for the requistion
        /// </summary>
        [StringLength(100)]
        [Unicode(false)]
        public string RequisitionDescription { get; set; }
    }
}