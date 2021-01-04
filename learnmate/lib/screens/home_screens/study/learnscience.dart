import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:learnmate/screens/home_screens/study/screncescreens/atomic.dart';
import 'package:learnmate/screens/home_screens/study/screncescreens/solarsystem.dart';

class LearnScienceMain extends StatefulWidget {
  @override
  _LearnScienceMainState createState() => _LearnScienceMainState();
}

class _LearnScienceMainState extends State<LearnScienceMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    "Science Topics",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SolaySystemList())),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.3,
                                          image: AssetImage(
                                              "assets/science_solarsystemicon.png"),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Solar System",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AtomicStructure(),
                              ),
                            ),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.3,
                                          image: AssetImage(
                                              "assets/scienceicon.png"),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Atomic Structure",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                new WebviewScaffold(
                                  url:
                                  "https://sciencenotes.org/wp-content/uploads/2018/02/PeriodicTableCharge-2018.png",
                                  appCacheEnabled: true,
                                  displayZoomControls: true,
                                  withZoom: true,
                                  appBar: new AppBar(
                                    backgroundColor: Colors.orange,
                                    title: new Text("Periodic Table"),
                                  ),
                                ),
                              ),
                            ),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.3,
                                          image: AssetImage(
                                              "assets/science_periodictable.png"),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Periodic Table",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        SolarySystemDetailScreen(
                                          heading: "Organic Chemistry",
                                          content:
                                          """<h2>What Is Organic Chemistry?<br>
</h2><p>Organic chemistry is the study of the structure, properties, composition, reactions, and preparation of carbon-containing compounds, which include not only hydrocarbons but also compounds with any number of other elements, including hydrogen (most compounds contain at least one carbon–hydrogen bond), nitrogen, oxygen, halogens, phosphorus, silicon, and sulfur. This branch of chemistry was originally limited to compounds produced by living organisms but has been broadened to include human-made substances such as plastics. The range of application of organic compounds is enormous and also includes, but is not limited to, pharmaceuticals, petrochemicals, food, explosives, paints, and cosmetics.</p>            <p>&nbsp; <br>        <div class="text cq-dd-image"><h2>Where Is Organic Chemistry Used?</h2>
        
            <p>Organic chemistry is a highly creative science in which chemists create new molecules and explore the properties of existing compounds. It is the most popular field of study for ACS chemists and Ph.D. chemists.</p>
<p>Organic compounds are all around us. They are central to the economic growth of the United States in the rubber, plastics, fuel, pharmaceutical, cosmetics, detergent, coatings, dyestuff, and agrichemical industries, to name a few. The very foundations of biochemistry, biotechnology, and medicine are built on organic compounds and their role in life processes. Many modern, high-tech materials are at least partially composed of organic compounds .</p>
<p>Organic chemists spend much of their time creating new compounds and developing better ways of synthesizing previously known compounds.</p>            <p>&nbsp; <br>
<div class="text cq-dd-image"><h2>Which Industries Hire Organic Chemists?<br>
</h2> <p>Organic chemists at all levels are generally employed by pharmaceutical, biotech, chemical, consumer product, and petroleum industries. Chemists in industry mainly work in development, while chemists in academia are involved in more basic research. The federal (e.g.,Food and Drug Administration Patent and Trademark Office) state, and local governments also hire organic chemists.</p>
        
            <h3><b>Biotechnology</b></h3>
Biotechnology (“biotech” for short) is a field of applied biology that involves using living organisms and bioprocesses to create or modify products for a specific use. The cultivation of plants has been viewed as the earliest example of biotechnology and the precursor to modern genetic engineering and cell and tissue culture technologies. Virtually all biotechnology products are the result of organic chemistry.</p>
<p>Biotechnology is used in in health care, crop production and agriculture, nonfood uses of crops and other products (e.g., biodegradable plastics, vegetable oil, biofuels), and environmental applications.</p>
<p><b>Biotechnology Companies:</b><br><p>These companies make products such as seeds for crops that are resistant to certain diseases, seed coatings with specific properties, and plants that are drought resistant.</p>
   <h3><b>Chemical</b></h3>
<p>The chemical industry is crucial to modern world economies and works to convert raw materials such as oil, natural gas, air, water, metals, and minerals into more than 70,000 different products. These base products are then used to make consumer products in addition to manufacturing, service, construction, agriculture, and other industries. &nbsp;</p>
<p>Over three-fourths of the chemical industry’s output worldwide is polymers and plastics. Chemicals are used to make a wide variety of consumer goods, as well as thousands of products that are inputs to the agriculture, manufacturing, construction, and service industries. The chemical industry itself consumes about a quarter of its own output. Major industrial customers include rubber and plastic products, textiles, apparel, petroleum refining, pulp and paper, and primary metals.</p>
<p><b>Chemical companies:</b><br>            <h3><b>Consumer Products</b></h3>
<p>Consumer products companies make consumer products for everyday use, such as soaps, detergents, cleaning products, plastic goods, and cosmetics.</p>
<p><b>Consumer products companies:</b><br>
            <h3><b>Petroleum</b></h3>
<p>The petroleum industry includes the global processes of exploration, extraction, refining, transporting, and marketing petroleum products. The largest volume products of the industry are fuel oil and gasoline. Petroleum is also the raw material for many chemical products, including pharmaceuticals, solvents, fertilizers, pesticides, and plastics. The industry is usually divided into three major components: upstream (exploration and production), midstream (transportation), and downstream (refining crude oil, processing and purifying natural gas, creating petrochemicals).</p>
<p><b>Petroleum companies:</b><br>       <h3><b>Pharmaceutical</b></h3>
<p>The pharmaceutical industry develops, produces, and markets drugs licensed for use as medications for humans or animals. Some pharmaceutical companies deal in brand-name (i.e., has a trade name and can be produced and sold only by the company holding the patent) and/or generic (i.e., chemically equivalent, lower-cost version of a brand<i>-</i>name drug) medications and medical devices (agents that act on diseases without chemical interaction with the body). Pharmaceuticals (brand name and generic) and medical devices are subject to a large number of country-specific laws and regulations regarding patenting, testing, safety assurance, efficacy, monitoring, and marketing.</p>

""",
                                          path: "js.jpg",
                                        ))),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.3,
                                          image: AssetImage(
                                              "assets/science_organic.png"),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Organic Chemistry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    SolarySystemDetailScreen(
                                      heading: "Inorganic",
                                      path: "jh.jpg",
                                      content: """<h2>What Is Inorganic Chemistry?<br>
</h2>Inorganic chemistry is concerned with the properties and behavior of inorganic compounds, which include metals, minerals, and organometallic compounds. While organic chemistry  is defined as the study of carbon-containing compounds and inorganic chemistry is the study of the remaining subset of compounds other than organic compounds, there is overlap between the two fields (such as organometallic compounds, which usually contain a metal or metalloid bonded directly to carbon)        <div class="text cq-dd-image"><h2>Where Is Inorganic Chemistry Used?</h2>
  <p>Inorganic compounds are used as catalysts, pigments, coatings, surfactants, medicines, fuels, and more. They often have high melting points and specific high or low electrical conductivity properties, which make them useful for specific purposes. For example:<br>
</p>
<ul>
<li><b>Ammonia</b> is a nitrogen source in fertilizer, and it is one of the major inorganic chemicals used in the production of nylons, fibers, plastics, polyurethanes (used in tough chemical-resistant coatings, adhesives, and foams), hydrazine (used in jet and rocket fuels), and explosives.<br>
<br>
</li>
<li><b>Chlorine</b> is used in the manufacture of polyvinyl chloride (used for pipes, clothing, furniture etc.), agrochemicals (e.g., fertilizer, insecticide, or soil treatment), and pharmaceuticals, as well as chemicals for water treatment and sterilization.<br>
<br>
</li>
<li><b>Titanium dioxide</b> is the naturally occurring oxide of titanium, which is used as a white powder pigment in paints, coatings, plastics, paper, inks, fibers, food, and cosmetics. Titanium dioxide also has good ultraviolet light resistance properties, and there is a growing demand for its use in photocatalysts.</li>
</ul>

        
            Inorganic chemists are employed in fields ranging from mining to microchips. Their work is based on understanding the behavior and the analogues for inorganic elements and how these materials can be modified, separated, and used. It includes developing methods to recover metals from waste streams; employment as analytical chemists specializing in the analysis of mined ores; and performing research on the use of inorganic chemicals for treating soil.
Many inorganic chemists work in industry, but they also work in academic institutions and in government labs. Inorganic chemists who work in government say their time is increasingly spent writing grant proposals and competing for research money
<p>Inorganic chemists compare their jobs to those of materials scientists and physicists. The common focus is on the exploration of the relationship between physical properties and functions, but an inorganic chemist is more concerned with these properties at the molecular level.</p>  Inorganic chemistry is a highly practical science—traditionally, a nation’s economy was evaluated by their production of sulfuric acid because it is one of the more important elements used as an industrial raw material.
<h1>Work Settings
</h1> <br>Inorganic chemists are employed in fields ranging from mining to microchips. Their work is based on understanding the behavior and the analogues for inorganic elements and how these materials can be modified, separated, and used. It includes developing methods to recover metals from waste streams; employment as analytical chemists specializing in the analysis of mined ores; and performing research on the use of inorganic chemicals for treating soil.

Many inorganic chemists work in industry, but they also work in academic institutions and in government labs. Inorganic chemists who work in government say their time is increasingly spent writing grant proposals and competing for research money.

Inorganic chemists compare their jobs to those of materials scientists and physicists. The common focus is on the exploration of the relationship between physical properties and functions, but an inorganic chemist is more concerned with these properties at the molecular level.<h1>Industries that Hire Inorganic Chemists
</h1>
<h3>Environmental Science
</h3><p>Environmental chemistry uses inorganic chemistry to understand how the uncontaminated environment works, which chemicals in what concentrations are present naturally, and with what effects. They also identify the effects of additives, such as fertilizers, on natural processes. The U.S. Environmental Protection Agency and other agencies detect and identify the nature and source of pollutants. </p><br>
<p>Companies that focus in environmental science include CH2M Hill, Bechtel, Veolia, URS Corporation, Black & Veatch, Tetra Tech, Energy Solutions, and government agencies as the U.S. Environmental Protection Agency (EPA). These companies study the chemical and biochemical phenomena that occur in natural places. They use atmospheric, aquatic, and soil chemistry, as well as analytical chemistry.

</p><h3><b>Microchip</b></h3>
<p>Chemistry and material science allows the production of inorganic electronics with highly ordered layers and interfaces that organic and polymer materials cannot provide. Precise control of surface composition results in microchips with specific, desired properties.</p>
<p>An integrated circuit or monolithic integrated circuit (also referred to as IC, chip, or microchip) is an electronic circuit manufactured by the patterned deposition (or diffusion) of trace elements into the surface of a thin substrate of semiconductor material. Additional materials are deposited and patterned to form interconnections between semiconductor devices.</p>
<p>Integrated circuits are used in virtually all electronic equipment today and have revolutionized society. Computers, cell phones, and other digital appliances are now inextricable parts of the structure of modern societies, made possible by the low cost of production of integrated circuits.</p>
<p>Integrated circuits are also being developed for sensoric applications in medical implants and other bioelectronic devices. These environments require special sealing strategies to avoid corrosion or biodegradation of the exposed semiconductor materials.</p><h3><b>Fibers and Plastics</b></h3>
<p>Fibers are materials that are continuous filaments or discrete elongated pieces, similar to lengths of thread. They are important for a variety of applications, including holding tissues together in both plants and animals. There are many different kinds of fibers including textile fiber, natural fibers, and synthetic or human-made fibers such as cellulose, mineral, polymer, and microfibers. Fibers can be spun into filaments, string, or rope; used as a component of composite material; or matted into sheets to make products such as paper. Fibers are often used in the manufacture of other materials. The strongest engineering materials are generally made as fibers, for example, carbon fiber and ultra-high-molecular-weight polyethylene. Synthetic fibers can often be produced cheaply and in large amounts as compared to natural fibers, but natural fibers have benefits some applications, especially for clothing.</p>
<p>Plastic material is any of a wide range of synthetic or semisynthetic organic solids used in the manufacture of industrial products. Plastics are typically polymers of high molecular mass and may contain other substances to improve performance and/or reduce production costs. Monomers of plastic are either natural or synthetic organic compounds.</p>
<p>Thermoplastics are plastics that do not undergo chemical change in their composition when heated and therefore can be molded again and again; examples are polyethylene, polypropylene, polystyrene, polyvinyl chloride, and polytetrafluoroethylene. The raw materials needed to make most of these plastics come from petroleum and natural gas.</p>
<p>Because of their relatively low cost, ease of manufacture, versatility, and imperviousness to water, plastics are used in a wide range of products, from paper clips to spaceships. However, these same properties make them persist beyond their usefulness, so much current work is focused on making photodegradable or other more environmentally friendly versions.</p><h3><b>Mining, Ore, and Metals</b></h3>
<p>Mining involves the extraction of valuable minerals or other geological materials from the earth or from an ore body, vein, or seam. Materials recovered by mining can include base metals, precious metals, iron, uranium, coal, diamonds, limestone, oil shale, rock salt, and potash. Any material that cannot be grown through agricultural processes or created in a laboratory or factory comes from mining. In the wider sense, mining comprises extraction of any nonrenewable resource (e.g., petroleum, natural gas, or even water) for human use.</p><h3><b>Paint, Pigment, and Coatings</b></h3>
<p>A pigment is a material that changes the color of reflected or transmitted light as the result of wavelength-selective absorption. Pigments are classified as either organic (derived from plant or animal sources) or inorganic (derived from salts or metallic oxides).</p>
<p>Pigments are used for coloring paint, ink, plastic, fabric, cosmetics, food, and other materials. Most pigments used in manufacturing and the visual arts are dry inorganic colorants, usually ground into a fine powder. This powder is added to a vehicle (or binder), which is a relatively neutral or colorless material that suspends the pigment and gives the paint its adhesion.</p>
""",
                                    ),
                              ),
                            ),
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.50,
                          child: Card(
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.3,
                                          image: AssetImage(
                                              "assets/science_inorganic.png"),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          "Inorganic Chemistry",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
