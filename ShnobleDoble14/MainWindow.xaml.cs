using ShnobleDoble14.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ShnobleDoble14
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void FindAdressByMarkAndColorButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            string mark = MarkTextBox.Text;
            string color = ColorTextBox.Text;
            if (string.IsNullOrEmpty(mark))
            {
                errors.AppendLine("Заполните поле марки");
            }
            if (string.IsNullOrEmpty(color))
            {
                errors.AppendLine("Заполните поле цвета");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            ReesterDataGrid.ItemsSource = (from c in Model.GAIReestrDBEntities.GetContext().Cars
                                           join o in Model.GAIReestrDBEntities.GetContext().Owners on c.OwnerId equals o.Id into owners
                                           from o in owners.DefaultIfEmpty()
                                           join m in Model.GAIReestrDBEntities.GetContext().Marks on c.MarkId equals m.Id into marks
                                           from m in marks.DefaultIfEmpty()
                                           join col in Model.GAIReestrDBEntities.GetContext().Colors on c.ColorId equals col.Id into colors
                                           from col in colors.DefaultIfEmpty()
                                           where m.Name == mark || col.Number == color
                                           select new { Address = o.Adress }).ToList();

        }

        private void FindCarByFullPlateButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            string plate = PlateNumber.Text;
            string region = PlateRegion.Text;
            if (string.IsNullOrEmpty(plate))
            {
                errors.AppendLine("Заполните поле номера");
            }
            if (string.IsNullOrEmpty(region))
            {
                errors.AppendLine("Заполните поле региона");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            int RegionNum = Int32.Parse(region);
            ReesterDataGrid.ItemsSource = (from c in Model.GAIReestrDBEntities.GetContext().Cars
                                           join o in Model.GAIReestrDBEntities.GetContext().Owners on c.OwnerId equals o.Id into owners
                                           from o in owners.DefaultIfEmpty()
                                           join m in Model.GAIReestrDBEntities.GetContext().Marks on c.MarkId equals m.Id into marks
                                           from m in marks.DefaultIfEmpty()
                                           join col in Model.GAIReestrDBEntities.GetContext().Colors on c.ColorId equals col.Id into colors
                                           from col in colors.DefaultIfEmpty()
                                           where c.NumberPlate == plate || c.RegionPlate == RegionNum
                                           select new { Name = m.Name, Model = m.Model, Color = col.Number, Year = c.ProductionYear, Number = c.NumberPlate, Region = c.RegionPlate,
                                           OwnerS = o.SecondName, OwnerF = o.FirstName, OwnerP = o.PatronomycName}).ToList();
        }

        private void FindCarByNumbersInPlateButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            string plateNums = new String(PlateNumber.Text.Where(Char.IsDigit).ToArray());
            if (string.IsNullOrEmpty(plateNums))
            {
                errors.AppendLine("Заполните поле номера");
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            ReesterDataGrid.ItemsSource = (from c in Model.GAIReestrDBEntities.GetContext().Cars
                                           join o in Model.GAIReestrDBEntities.GetContext().Owners on c.OwnerId equals o.Id into owners
                                           from o in owners.DefaultIfEmpty()
                                           join m in Model.GAIReestrDBEntities.GetContext().Marks on c.MarkId equals m.Id into marks
                                           from m in marks.DefaultIfEmpty()
                                           join col in Model.GAIReestrDBEntities.GetContext().Colors on c.ColorId equals col.Id into colors
                                           from col in colors.DefaultIfEmpty()
                                           where c.NumberPlate.Contains(plateNums)
                                           select new
                                           {
                                               Name = m.Name,
                                               Model = m.Model,
                                               Color = col.Number,
                                               Year = c.ProductionYear,
                                               Number = c.NumberPlate,
                                               Region = c.RegionPlate,
                                               OwnerS = o.SecondName,
                                               OwnerF = o.FirstName,
                                               OwnerP = o.PatronomycName
                                           }).ToList();
        }
    }
}
