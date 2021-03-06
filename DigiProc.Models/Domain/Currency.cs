// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace DigiProc.Models.Domain
{
    [Table("Currency")]
    public partial class Currency
    {
        [Key]
        [Column("CurrencyID")]
        public int CurrencyId { get; set; }
        /// <summary>
        /// the name of the currency
        /// </summary>
        [StringLength(50)]
        [Unicode(false)]
        public string CurrencyName { get; set; }
        /// <summary>
        /// the symbol of the currency
        /// </summary>
        [StringLength(4)]
        [Unicode(false)]
        public string CurrencySymbol { get; set; }
    }
}