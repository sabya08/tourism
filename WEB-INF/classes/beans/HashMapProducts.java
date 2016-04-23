package beans;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class HashMapProducts {
     HashMap<Integer,Product> hmap = new HashMap<Integer, Product>();

    /*Adding elements to HashMap*/ 
    //images/img_XBoxOriginal.jpgl
    public void setHashMapProduct() {
    Product p1=new Product("Canon EOS","Canon",500.0,"CameraCamcorders","images/cameraandcamcorders/canoneos.jpg","This is Canon EOS.\n40x zoom.\n50.6 MP.\nDSLR", "",true,true);
    Product p2=new Product("Canon EOS 7D","Canon",800.0,"CameraCamcorders","images/cameraandcamcorders/canoneos7d.jpg","This is Canon EOS 7D.80x zoom.50.6MP.DSLR", "",true,true);
    Product p3=new Product("Canon EOS M3","Canon",700.0,"CameraCamcorders","images/cameraandcamcorders/canoneosm3.jpg","This is Canon EOS M3.60x zoom.40.6MP.DSLR", "",true,true);    
    Product p4=new Product("Canon EOS M10","Canon",800.0,"CameraCamcorders","images/cameraandcamcorders/canoneosm10.jpg","This is Canon EOS M10.50x zoom.42.6MP.DSLR", "",true,true);
	Product p5=new Product("Fujifilm X 100T","Fujifilm",600.0,"CameraCamcorders","images/cameraandcamcorders/fujifilmx100t.jpg","This is Fujifilm X 100T.80x zoom.50.6MP.DSLR", "",true,true);
	Product p6=new Product("Fujifilm X A2","Fujifilm",800.0,"CameraCamcorders","images/cameraandcamcorders/fujifilmxa2.jpg","This is Fujifilm X A2.60x zoom.40.6MP.DSLR", "",true,true);
	Product p7=new Product("Fujifilm X E2","Fujifilm",700.0,"CameraCamcorders","images/cameraandcamcorders/fujifilmxe2.jpg","This is Fujifilm X E2.50x zoom.32.6MP.DSLR", "",true,true);
	Product p8=new Product("Fujifilm X T1","Fujifilm",500.0,"CameraCamcorders","images/cameraandcamcorders/fujifilmxt1.jpg","This is Fujifilm X T1.40x zoom.22.6MP.SLR", "",true,true);
	Product p9=new Product("Nikon Coolipix L840","Nikon",300.0,"CameraCamcorders","images/cameraandcamcorders/nikoncoolpixl840.jpg","This is Nikon Coolpix L840.20x zoom.32.6MP.SLR", "",true,true);
	Product p10=new Product("Nikon Coolipix P530","Nikon",400.0,"CameraCamcorders","images/cameraandcamcorders/nikoncoolpixp530.jpg","This is Nikon Coolpix P530.30x zoom.40.6MP.DSLR", "",true,true);
	Product p11=new Product("Nikon D3200","Nikon",800.0,"CameraCamcorders","images/cameraandcamcorders/nikond3200.jpg","This is Nikon D3200.50x zoom.50.6MP.DSLR", "",true,true);
	Product p12=new Product("Nikon D3300","Nikon",600.0,"CameraCamcorders","images/cameraandcamcorders/nikond3300.jpg","This is Nikon D3300.60x zoom.40.6MP.DSLR", "",true,true);
	Product p13=new Product("Sony A5000","Sony",700.0,"CameraCamcorders","images/cameraandcamcorders/sonya5000.jpg","This is Sony A5000.60x zoom.40.6MP.DSLR", "",true,true);
	Product p14=new Product("Sony A5100","Sony",600.0,"CameraCamcorders","images/cameraandcamcorders/sonya5100.jpg","This is Sony A5100.40x zoom.50.6MP.DSLR", "",true,true);
	Product p15=new Product("Sonyalpha","Sony",400.0,"CameraCamcorders","images/cameraandcamcorders/sonyalpha.jpg","This is Sony Alpha.30x zoom.30.6MP.SLR", "",true,true);    
	Product p16=new Product("Sony Cybershot RX100","Sony",900.0,"CameraCamcorders","images/cameraandcamcorders/sonycybershotrx100.jpg","This is Sony Cybershot RX100.80x zoom.40.6MP.DSLR", "",true,true);    
    Product p17=new Product("Acer E1 532","Acer",600.0,"ComputersTablets","images/laptopandtablets/acere1532.jpg","This is Acer E1 532.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p18=new Product("Acer E1 472","Acer",700.0,"ComputersTablets","images/laptopandtablets/acere1472.jpg","This is Acer E1 472.i7 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p19=new Product("Acer E1 731","Acer",800.0,"ComputersTablets","images/laptopandtablets/acere1731.jpg","This is Acer E1 731.i7 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p20=new Product("Acer E1 771","Acer",850.0,"ComputersTablets","images/laptopandtablets/acere1771.jpg","This is Acer E1 771.i7 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p21=new Product("Apple Macbook Air","Apple",1000.0,"ComputersTablets","images/laptopandtablets/applemacbookair.jpg","This is Macbook Air.i7 processor.8GB RAM.500GB HDD.", "",true,true);    
	Product p22=new Product("Apple Macbook Pro","Apple",1200.0,"ComputersTablets","images/laptopandtablets/applemacbookpro.jpg","This is Macbook Pro.i7 processor.8GB RAM.500GB HDD.", "",true,true);    
	Product p23=new Product("Dell Alienware 15","Dell",700.0,"ComputersTablets","images/laptopandtablets/dellalienware15.jpg","This is Dell Alienware.i5 processor.8GB RAM.1TB HDD.", "",true,true);    
	Product p24=new Product("Dell Chromebook 11","Dell",600.0,"ComputersTablets","images/laptopandtablets/dellchromebook11.jpg","This is Dell Chromebook 11.i5 processor.8GB RAM.1TB HDD.", "",true,true);    
	Product p25=new Product("Dell inspiron 13","Dell",900.0,"ComputersTablets","images/laptopandtablets/dellinspiron13.jpg","This is Dell Inspiron 13.i5 processor.8GB RAM.1TB HDD.", "",true,true);    
	Product p26=new Product("Dell inspiron 14","Dell",800.0,"ComputersTablets","images/laptopandtablets/dellinspiron14.jpg","This is Dell Inspiron 14.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p27=new Product("Lenovo 440 P","Dell",800.0,"ComputersTablets","images/laptopandtablets/lenovo440p.jpg","This is Lenovo 440 P.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p28=new Product("Lenovo Thinkpad x1","Dell",750.0,"ComputersTablets","images/laptopandtablets/lenovothinkpadx1.jpg","This is Lenovo Thinkpad x1.i5 processor.8GB RAM.1TB HDD.", "",true,true);		
	Product p29=new Product("Lenovo Y 700","Dell",700.0,"ComputersTablets","images/laptopandtablets/lenovoy700.jpg","This is Lenovo Y 700.i5 processor.8GB RAM.1TB HDD.", "",true,true);
    Product p30=new Product("Lenovo Yoga Series","Dell",900.0,"ComputersTablets","images/laptopandtablets/lenovoyogaseries.jpg","This is Lenovo Yoga Series.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p31=new Product("Samsung Ativ Book9 Plus ","Samsung",600.0,"ComputersTablets","images/laptopandtablets/samsungativbook9plus.jpg","This is Samsung Ativ plus.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p32=new Product("Samsung Ativ Book9 Pro","Samsung",800.0,"ComputersTablets","images/laptopandtablets/samsungativbook9pro.jpg","This is Samsung Ativ pro.i5 processor.8GB RAM.1TB HDD.", "",true,true);		
	Product p33=new Product("Samsung Ativ Book9 Spin","Samsung",900.0,"ComputersTablets","images/laptopandtablets/samsungativbook9spin.jpg","This is Samsung Ativ spin.i5 processor.8GB RAM.1TB HDD.", "",true,true);
	Product p34=new Product("Beaumatic Washing Machine","Beaumatic",500.0,"Appliances","images/Appliances/beumaticwashingmachine.jpg","This is Beaumatic washing machine.Front load.5.7 Cu ft.", "",true,true);
	Product p35=new Product("Cannylife Washing Machine","Cannylife",900.0,"Appliances","images/Appliances/cannylifewashingmachine.jpg","This is Cannylife washing machine.Top load.8.4 Cu ft.", "",true,true);
	Product p36=new Product("LG Washing Machine","LG",900.0,"Appliances","images/Appliances/lgwashingmachine.jpg","This is LG washing machine.Front load.5.7 Cu ft.", "",true,true);
	Product p37=new Product("Whirlpool Washing Machine","Whirlpool",1000.0,"Appliances","images/Appliances/whirlpoolwashingmachine.jpg","This is Whirlpool washing machine.Top load.8.4 Cu ft.", "",true,true);
	Product p38=new Product("Fuller Vacuum Cleaner","Fuller",1100.0,"Appliances","images/Appliances/fullervacuumcleaner.jpg","This is Fuller Vacuum Cleaner.2.6 KW. 21.7 Filter Area.", "",true,true);
	Product p39=new Product("Gemino Vacuum Cleaner","Gemino",800.0,"Appliances","images/Appliances/geminovacuumcleaner.jpg","This is Gemino Vacuum Cleaner.2.6 KW. 21.7 Filter Area.", "",true,true);
	Product p40=new Product("Miele Vacuum Cleaner","Miele",100.0,"Appliances","images/Appliances/mielevacuumcleaner.jpg","This is Miele Vacuum Cleaner.2.6 KW. 21.7 Filter Area.", "",true,true);
	Product p41=new Product("Royal Vacuum Cleaner","Royal",200.0,"Appliances","images/Appliances/royalvacuumcleaner.jpg","This is Royal Vacuum Cleaner.2.6 KW. 21.7 Filter Area.", "",true,true);
	Product p42=new Product("GE Air Conditioner","GE",200.0,"Appliances","images/Appliances/geairconditioner.jpg","This is GE Air Conditioner.Expanded cooling.Split System.", "",true,true);
	Product p43=new Product("LG Air Conditioner","LG",200.0,"Appliances","images/Appliances/lgairconditioner.jpg","This is LG Air Conditioner.Expanded cooling.Split System.", "",true,true);
	Product p44=new Product("Samsung Air Conditioner","Samsung",400.0,"Appliances","images/Appliances/samsungairconditioner.jpg","This is Samsung Air Conditioner.Expanded cooling.Split System.", "",true,true);
	Product p45=new Product("Whirlpool Air Conditioner","Whirlpool",500.0,"Appliances","images/Appliances/whirlpoolairconditioner.jpg","This is Whirlpool Air Conditioner.Expanded cooling.Split System.", "",true,true);
	Product p46=new Product("GE Refrigerator","GE",200.0,"Appliances","images/Appliances/gerefrigerator.jpg","This is GE Refrigerator.3 Door.250 LTR.", "",true,true);
	Product p47=new Product("LG Refrigerator","LG",300.0,"Appliances","images/Appliances/lgrefrigerator.jpg","This is LG Refrigerator.2 Door.250 LTR.", "",true,true);
	Product p48=new Product("Samsung Refrigerator","Samsung",400.0,"Appliances","images/Appliances/samsungrefrigerator.jpg","This is Samsung Refrigerator.3 Door.250 LTR.", "",true,true);
	Product p49=new Product("Whirlpool Refrigerator","Whirlpool",400.0,"Appliances","images/Appliances/whirlpoolrefrigerator.jpg","This is Whirlpool Refrigerator.2 Door.250 LTR.", "",true,true);
	Product p50=new Product("LG 32 Inches TV","LG",200.0,"TVHomeTheater","images/Tv/lg32.jpg","This is LG TV.32'.LED", "",true,true);
	Product p51=new Product("LG 40 Inches TV","LG",330.0,"TVHomeTheater","images/Tv/lg40.jpg","This is LG TV.40'.LED", "",true,true);
	Product p52=new Product("LG 65 Inches TV","LG",500.0,"TVHomeTheater","images/Tv/lg65.jpg","This is LG TV.65'.LED.", "",true,true);
	Product p53=new Product("LG Home Theater","LG",900.0,"TVHomeTheater","images/Tv/lghometheatre.jpg","This is LG Home Theater.", "",true,true);
	Product p54=new Product("Philips 32 Inches TV","Philips",200.0,"TVHomeTheater","images/Tv/philips32.jpg","This is Philips TV.32'.LED.", "",true,true);
	Product p55=new Product("Philips 40 Inches TV","Philips",300.0,"TVHomeTheater","images/Tv/philips40.jpg","This is Philips TV.40'.LED.", "",true,true);
	Product p56=new Product("Philips 65 Inches TV","Philips",600.0,"TVHomeTheater","images/Tv/philips65.jpg","This is Philips TV.65'.LED.", "",true,true);
	Product p57=new Product("Philips Home Theater","Philips",900.0,"TVHomeTheater","images/Tv/philipshometheatre.jpg","This is Philips Home Theater.", "",true,true);
	Product p58=new Product("Samsung 32 Inches TV","Samsung",200.0,"TVHomeTheater","images/Tv/samsung32.jpg","This is Samsung TV.32'.LED.", "",true,true);
	Product p59=new Product("Samsung 40 Inches TV","Samsung",300.0,"TVHomeTheater","images/Tv/samsung40.jpg","This is Samsung TV.40'.LED.", "",true,true);
	Product p60=new Product("Samsung 65 Inches TV","Samsung",600.0,"TVHomeTheater","images/Tv/samsung65.jpg","This is Samsung TV.65'.LED.", "",true,true);
	Product p61=new Product("Samsung Home Theater","Samsung",900.0,"TVHomeTheater","images/Tv/samsunghometheatre.jpg","This is Samsung Home Theater.", "",true,true);
	Product p62=new Product("Videocon 32 Inches TV","Videocon",200.0,"TVHomeTheater","images/Tv/videocon32.jpg","This is Videocon TV.32'.LED.", "",true,true);
	Product p63=new Product("Videocon 40 Inches TV","Videocon",300.0,"TVHomeTheater","images/Tv/videocon40.jpg","This is Videocon TV.40'.LED.", "",true,true);
	Product p64=new Product("Videocon 65 Inches TV","Videocon",600.0,"TVHomeTheater","images/Tv/videocon65.jpg","This is Videocon TV.65'.LED.", "",true,true);
	Product p65=new Product("Videocon Home Theater","Videocon",900.0,"TVHomeTheater","images/Tv/videoconhometheatre.jpg","This is Videocon Home Theater.", "",true,true);
	Product p66=new Product("Bose Headphone","Samsung",200.0,"Audio","images/Audio/boseheadphone.jpg","This is Bose Headphone.Closed back.102dB/mW", "",true,true);
	Product p67=new Product("Beats Headphone ","Samsung",200.0,"Audio","images/Audio/beatsheadphone.jpg","This is Beats Headphone.Closed back.108dB/mW", "",true,true);
	Product p68=new Product("Sony Headphone","Samsung",100.0,"Audio","images/Audio/sonyheadphone.jpg","This is Sony Headphone.Closed back.102dB/mW", "",true,true);
	Product p69=new Product("Skullcandy Headphone","Samsung",100.0,"Audio","images/Audio/skullcandyheadphone.jpg","This is Skullcandy Headphone.Closed back.108dB/mW", "",true,true);
	Product p70=new Product("Bose Speaker","Samsung",200.0,"Audio","images/Audio/bosespeaker.jpg","This is Bose Speaker.300 watt.6dB/oct", "",true,true);
	Product p71=new Product("Beats Speaker ","Samsung",300.0,"Audio","images/Audio/beatsspeaker.jpg","This is Beats Speaker.300 watt.6.5dB/oct", "",true,true);
	Product p72=new Product("Sony Speaker","Samsung",200.0,"Audio","images/Audio/sonyspeaker.jpg","This is Sony Speaker.300 watt.6dB/oct", "",true,true);
	Product p73=new Product("Skullcandy Speaker","Samsung",300.0,"Audio","images/Audio/skullcandyspeaker.jpg","This is SkullCandy Speaker.300 watt.6.5dB/oct", "",true,true);
	Product p74=new Product("Samsung Tab","Samsung",300.0,"ComputersTablets","images/laptopandtablets/samsungtab.jpg","This is Samsung Tab.9.6'.16GB.", "",true,true);		
	Product p75=new Product("Datawind Tab","Datawind",300.0,"ComputersTablets","images/laptopandtablets/datawind.jpg","This is Samsung Tab.9.6'.16GB.", "",true,true);		
	Product p76=new Product("Dell Tab","Dell",300.0,"ComputersTablets","images/laptopandtablets/dell.jpg","This is Samsung Tab.9.6'.16GB.", "",true,true);		
	Product p77=new Product("Digiflip Tab","Digiflip",300.0,"ComputersTablets","images/laptopandtablets/digiflip.jpg","This is Digiflip Tab.9.6'.16GB.", "",true,true);		
	Product p78=new Product("Ipad air2","Apple",400.0,"ComputersTablets","images/laptopandtablets/ipadair2.jpg","This is Ipad air 2.12.6'.32GB.", "",true,true);		
	Product p79=new Product("Ipad Mini ","Apple",400.0,"ComputersTablets","images/laptopandtablets/ipadmini.jpg","This is Ipad Mini.12.6'.32GB.", "",true,true);		
	Product p80=new Product("Lenovo Tab","Lenovo",300.0,"ComputersTablets","images/laptopandtablets/lenovo.jpg","This is Lenovo Tab.9.6'.16GB.", "",true,true);		
	
	
	
	// TODO Auto-generated method stub
         hmap.put(1, p1);
         hmap.put(2,p2);
		 hmap.put(3,p3);
		 hmap.put(4,p4);
		 hmap.put(5,p5);
		 hmap.put(6,p6);
		 hmap.put(7,p7);
		 hmap.put(8,p8);
		 hmap.put(9,p9);
		 hmap.put(10,p10);
		 hmap.put(11,p11);
		 hmap.put(12,p12);
		 hmap.put(13,p13);
		 hmap.put(13,p13);
		 hmap.put(14,p14);
		 hmap.put(15,p15);
		 hmap.put(16,p16);
		 hmap.put(17,p17);
		 hmap.put(18,p18);
		 hmap.put(19,p19);
		 hmap.put(20,p20);
		 hmap.put(21,p21);
		 hmap.put(22,p22);
		 hmap.put(23,p23);
		 hmap.put(24,p24);
		 hmap.put(25,p25);
		 hmap.put(26,p26);
		 hmap.put(27,p27);
		 hmap.put(28,p28);
		 hmap.put(29,p29);
		 hmap.put(30,p30);
		 hmap.put(31,p31);
		 hmap.put(32,p32);
		 hmap.put(33,p33);
		 hmap.put(34,p34);
		 hmap.put(35,p35);
		 hmap.put(36,p36);
		 hmap.put(37,p37);
		 hmap.put(38,p38);
		 hmap.put(39,p39);
		 hmap.put(40,p40);
		 hmap.put(41,p41);
		 hmap.put(42,p42);
		 hmap.put(43,p43);
		 hmap.put(44,p44);
		 hmap.put(45,p45);
		 hmap.put(46,p46);
		 hmap.put(47,p47);
		 hmap.put(48,p48);
		 hmap.put(49,p49);
		 hmap.put(50,p50);
		 hmap.put(51,p51);
		 hmap.put(52,p52);
		 hmap.put(53,p53);
		 hmap.put(54,p54);
		 hmap.put(55,p55);
		 hmap.put(56,p56);
		 hmap.put(57,p57);
		 hmap.put(58,p58);
		 hmap.put(59,p59);
		 hmap.put(60,p60);
		 hmap.put(61,p61);
		 hmap.put(62,p62);
		 hmap.put(63,p63);
		 hmap.put(64,p64);
		 hmap.put(65,p65);
		 hmap.put(66,p66);
		 hmap.put(67,p67);
		 hmap.put(68,p68);
		 hmap.put(69,p69);
		 hmap.put(70,p70);
		 hmap.put(71,p71);
		 hmap.put(72,p72);
		 hmap.put(73,p73); 
		 hmap.put(74,p74); 
		 hmap.put(75,p75); 
		 hmap.put(76,p76); 
		 hmap.put(77,p77); 
		 hmap.put(78,p78); 
		 hmap.put(79,p79); 
		 hmap.put(80,p80); 
		 //hmap.put(81,p81); 
		 //hmap.put(82,p82); 
         // hmap.put(p3.Id, p3);
         // hmap.put(p4.Id, p4);    
         // hmap.put(p5.Id, p5);
         // hmap.put(p6.Id,p6);
         // hmap.put(p7.Id, p7);
         // hmap.put(p8.Id, p8);      

    }
    
    public HashMap<Integer,Product> getHashMapProduct() {
        
            return hmap;
    }

    
    // public void iterateHashMap() {
    //     Iterator<Integer> productIterator=hmap.keySet().iterator();//put debug point at this line
         
    //     while(productIterator.hasNext())
    //     {
    //         Integer id=productIterator.next();
    //         Product p=hmap.get(id);
    //         System.out.println(p.Name+"----");
    //         System.out.println(p.imagePath+"----");
    //     }

    // }


}