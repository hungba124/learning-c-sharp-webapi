﻿// // <auto-generated />
// using Microsoft.EntityFrameworkCore;
// using Microsoft.EntityFrameworkCore.Infrastructure;
// using Microsoft.EntityFrameworkCore.Migrations;
// using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
// using Oracle.EntityFrameworkCore.Metadata;
// using csharp002_webapi.Data;

// #nullable disable

// namespace csharp002_webapi.Migrations
// {
//     [DbContext(typeof(DataContext))]
//     [Migration("20230601142334_InitialCreate")]
//     partial class InitialCreate
//     {
//         /// <inheritdoc />
//         protected override void BuildTargetModel(ModelBuilder modelBuilder)
//         {
// #pragma warning disable 612, 618
//             modelBuilder
//                 .HasAnnotation("ProductVersion", "7.0.5")
//                 .HasAnnotation("Relational:MaxIdentifierLength", 128);

//             OracleModelBuilderExtensions.UseIdentityColumns(modelBuilder);

//             modelBuilder.Entity("csharp002_webapi.Models.Character", b =>
//                 {
//                     b.Property<int>("Id")
//                         .ValueGeneratedOnAdd()
//                         .HasColumnType("NUMBER(10)");

//                     OraclePropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

//                     b.Property<int>("Class")
//                         .HasColumnType("NUMBER(10)");

//                     b.Property<int>("Defense")
//                         .HasColumnType("NUMBER(10)");

//                     b.Property<int>("HitPoints")
//                         .HasColumnType("NUMBER(10)");

//                     b.Property<int>("Intelligence")
//                         .HasColumnType("NUMBER(10)");

//                     b.Property<string>("Name")
//                         .IsRequired()
//                         .HasColumnType("NVARCHAR2(2000)");

//                     b.Property<int>("Strength")
//                         .HasColumnType("NUMBER(10)");

//                     b.HasKey("Id");

//                     b.ToTable("Characters");
//                 });
// #pragma warning restore 612, 618
//         }
//     }
// }
