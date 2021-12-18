using System;
using System.Collections.Generic;
using System.Linq;
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

namespace LearnSchool
{
    /// <summary>
    /// Логика взаимодействия для ServicesPage.xaml
    /// </summary>
    public partial class ServicesPage : Page
    {
        public ServicesPage()
        {
            InitializeComponent();
        }

        private void AddService_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("В разработке");
        }

        private void DeleteService_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("В разработке");
        }

        private void BtnChangeService_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("В разработке");
        }
    }
}
