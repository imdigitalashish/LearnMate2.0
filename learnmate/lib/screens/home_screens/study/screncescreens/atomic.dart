import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AtomicStructure extends StatefulWidget {
  @override
  _AtomicStructureState createState() => _AtomicStructureState();
}

class _AtomicStructureState extends State<AtomicStructure> {
  Widget htmlRenderer(dataS) {
    return Html(data: dataS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "Atomic Structure",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Image(
              image: AssetImage("assets/atomic_structure.jpg"),
            ),
            htmlRenderer(
                """<h1>Atomic Structure - Discovery of Subatomic Particles</h1>



								<p>Atomic structure refers to the structure of atom comprising of a <strong>nucleus</strong> (center) in which the <strong>protons</strong> (positively charged) and <strong>neutrons</strong> (neutral) are present. The negatively charged particles called <strong>electrons</strong> revolve around the <strong>center of the nucleus</strong>.</p>
<p>The history of atomic structure and quantum mechanics dates back to the times of Democritus, the man who first proposed that matter is composed of atoms.</p>
<div id="attachment_1070061" style="width: 662px" class="wp-caption aligncenter"><p class="wp-caption-text"><strong>The Structure of Atom &#8211; Electrons, Protons, and Neutrons</strong></p></div>
<p>The study about the structure of atom gives a great insight into the entire class of chemical reactions, bonds, and their physical properties. The first scientific theory of atomic structure was proposed by John Dalton in 1800s.</p><p>The advances in atomic structure and quantum mechanics have led to the discovery of other fundamental particles. The<strong> discovery of subatomic particles</strong> has been the base for many other discoveries and inventions.<br />
<h2><span style="color: #800080;">What is Atomic Structure?</span></h2>
<p>The atomic structure of an element refers to the constitution of its nucleus and the arrangement of the electrons around it. Primarily, the atomic structure of matter is made up of <a href="https://byjus.com/chemistry/protons/">protons</a>, electrons, and neutrons.</p>
<p>The <strong>protons and neutrons</strong> make up the nucleus of the atom, which is surrounded by the electrons belonging to the atom. The<strong> atomic number</strong> of an element describes the total number of protons in its nucleus.</p>
<p>Neutral atoms have equal numbers of protons and electrons. However, atoms may gain or lose electrons in order to increase their stability, and the resulting charged entity is called an ion.</p>
<p>Atoms of different elements have different atomic structures because they contain different numbers of <a href="https://byjus.com/chemistry/electrons/">protons and electrons</a>. This is the reason for the unique characteristics of different elements.<br />
<a id="Atomic-Models" name="Atomic-Models"></a></p>
<h2><span style="color: #800080;">Atomic Models</span></h2>
<p>In the 18th and 19th centuries, many scientists attempted to explain the structure of the atom with the help of atomic models. Each of these models had their own merits and demerits and were pivotal to the development of the <strong>modern atomic model</strong>. The most notable contributions to the field were by the scientists John Dalton, J.J. Thomson, Ernest Rutherford, and Niels Bohr. Their ideas on the structure of the atom are discussed in this subsection.<br />
<a id="Daltons-Atomic-Theory" name="Daltons-Atomic-Theory"></a></p>
<h2><span style="color: #800080;">Dalton’s Atomic Theory</span></h2>
<p>The English chemist <strong>John Dalton</strong> suggested that all matter is made up of atoms, which were indivisible and indestructible. He also stated that all the atoms of an element were exactly the same, but the atoms of different elements differ in size and mass.</p>
<p>Chemical reactions, according to Dalton’s atomic theory, involves a rearrangement of atoms to form products. According to the postulates proposed by Dalton, the atomic structure comprised of atoms, the smallest particle responsible for the <a href="https://byjus.com/chemistry/chemical-reactions/">chemical reactions</a> to occur.</p>
<p><strong>The following are the postulates of his theory: </strong></p>
<ul>
<li>Every matter is made up of atoms.</li>
<li>Atoms are indivisible.</li>
<li>Specific elements have only one type of atoms in them.</li>
<li>Each atom has its own constant mass that varies from element to element.</li>
<li>Atoms undergo rearrangement during a chemical reaction.</li>
<li>Atoms can neither be created nor be destroyed but can be transformed from one form to another.</li>
</ul>
<p>Dalton’s atomic theory successfully explained the <a href="https://byjus.com/chemistry/laws-of-chemical-combination-for-elements-and-compounds/">Laws of chemical reactions</a>, namely, the Law of conservation of mass, Law of constant properties, Law of multiple proportions, and Law of reciprocal proportions</p>
<h3><span style="color: #800080;">Demerits of Dalton’s Atomic Theory</span></h3>
<ul>
<li>The theory was unable to explain the existence of isotopes.</li>
<li>Nothing about the structure of atom was appropriately is explained.</li>
<li>Later, the scientists discovered particles inside the atom that proved, the atoms are divisible.</li>
</ul>
<p>The discovery of particles inside atoms led to a better understanding of chemical species, these particles inside the atoms are called subatomic particles. The discovery of various subatomic particles is as follows:<br />
<a id="Thomson-Atomic-Model" name="Thomson-Atomic-Model"></a></p>
<h2><span style="color: #800080;">Thomson Atomic Model</span></h2>
<p>The English chemist Sir Joseph John Thomson put forth his model describing the atomic structure in the early 1900s.</p>
<p>He was later awarded the Nobel prize for the <strong>discovery of “electrons”</strong>. His work is based on an experiment called <a href="https://byjus.com/chemistry/cathode-ray-experiment/">cathode ray experiment</a>. The construction of working of the experiment is as follows:</p>"""),
            Image(
              image: AssetImage("assets/cathod.jpg"),
            ),
            htmlRenderer("""<h3><span style="color: #800080;">Cathode Ray Experiment</span></h3>
<p>It has a tube made of glass which has two openings, one for the vacuum pump and the other for the inlet through which a gas is pumped in.</p><p>The role of the vacuum pump is to maintain “partial vacuum” inside the glass chamber. A high voltage power supply is connected using <a href="https://byjus.com/chemistry/electrodes/">electrodes i.e. cathode and Anode</a> is fitted inside the glass tube.</p>
<h4><span style="color: #800080;">Observations:</span></h4>
<ul>
<li>When a high voltage power supply is switched on, there were rays emerging from the cathode towards the anode. This was confirmed by the ‘Fluorescent spots’ on the ZnS screen used. These rays were called “Cathode Rays”.</li>
<li>When an external electric field is applied, the cathode rays get deflected towards the positive electrode, but in the absence of electric field, they travel in a straight line.</li>
<li>When rotor Blades are placed in the path of the cathode rays, they seem to rotate. This proves that the cathode rays are made up of particles of a certain mass so that they have some energy.</li>
</ul>"""),
            Image(image: AssetImage("assets/cathode_ray_experiment.png"),),
            htmlRenderer("""
<li>With all this evidence, Thompson concluded that cathode rays are made of negatively charged particle called “electrons”.</li>
<li>On applying the <a href="https://byjus.com/physics/electricity-and-magnetism/">electric and magnetic field</a> upon the cathode rays (electrons), Thomson found the charge to mass ratio (e/m) of electrons. (e/m) for electron: 17588 × 1011 e/bg.</li>
</ul>
<p>From this ratio, the charge of the electron was found by <a href="https://byjus.com/chemistry/oil-drop-experiment/">Mullikin through oil drop experiment</a>. [Charge of e- = 1.6 × 10-16 C and Mass of e- = 9.1093 × 10-31 kg].</p>
<h4><span style="color: #800080;">Conclusions:</span></h4>
<p>Based on conclusions from his cathode ray experiment, Thomson described the atomic structure as a positively charged sphere into which negatively charged electrons were embedded.</p>
<p>It is commonly referred to as the <strong>“plum pudding model”</strong> because it can be visualized as a plum pudding dish where the pudding describes to the positively charged atom and the plum pieces describe the electrons.</p>
<p>Thomson&#8217;s atomic structure described atoms as electrically neutral, i.e. the positive and the negative charges were of equal magnitude.</p>
<p><strong>Limitations of Thomson&#8217;s Atomic Structure: </strong>Thomson&#8217;s atomic model does not clearly explain the stability of an atom. Also, further discoveries of other subatomic particles, couldn’t be placed inside his atomic model.<br />
<a id="Rutherford-Atomic-Theory" name="Rutherford-Atomic-Theory"></a></p>
<h2><span style="color: #800080;">Rutherford Atomic Theory</span></h2>
<p>Rutherford, a student of J. J. Thomson modified the atomic structure with the discovery of another <strong>subatomic particle called “Nucleus”</strong>. His atomic model is based on the Alpha ray scattering experiment.</p>
<h3><span style="color: #800080;">Alpha Ray Scattering Experiment</span></h3>
<h4><span style="color: #800080;">Construction:</span></h4>
<ul>
<li>A very thin gold foil of 1000 atoms thick is taken.</li>
<li>Alpha rays (doubly charged Helium He2+) were made to bombard the gold foil.</li>
<li>ZnS screen is placed behind the gold foil.</li>
</ul>
<h4><span style="color: #800080;">Observations:</span></h4>
<ul>
<li>Most of the rays just went through the gold foil making scintillations (bright spots) in the <a href="https://byjus.com/zinc-sulfide-formula/">ZnS</a> screen.</li>
<li>A few rays got reflected after hitting the gold foil.</li>
<li>One in 1000 rays got reflected by an angle of 180° (retraced path) after hitting the gold foil.</li>
</ul>
<h4><span style="color: #800080;">Conclusions:</span></h4>
<ul>
<li>Since most rays passed through, Rutherford concluded that most of the space inside the atom is empty.</li>
<li>Few rays got reflected because of the repulsion of its positive with some other positive charge inside the atom.</li>
<li>1/1000th of rays got strongly deflected because of a very strong positive charge in the center of the atom he called this strong positive charge as “nucleus”.</li>
<li>He said most of the charge and mass of the atom resides in the Nucleus</li>
</ul>
<h3><span style="color: #800080;">Rutherford&#8217;s Structure of Atom</span></h3>
<p>Based on the above observations and conclusions, <a href="https://byjus.com/chemistry/rutherfords-model-of-atoms-and-its-limitations/">Rutherford proposed his own atomic structure</a> which is as follows.</p>
<ul>
<li>The nucleus is at the center of an atom, where most of the charge and mass are concentrated.</li>
<li>Atomic structure is spherical.</li>
<li>Electrons revolve around the nucleus in a circular orbit, similar to the way planets orbit the sun.</li>
</ul>
<h3><span style="color: #800080;">Limitations of Rutherford Atomic Model</span></h3>
<ul>
<li>If electrons have to revolve around the nucleus, they will spend energy and that too against the strong force of attraction from the nucleus, a lot of energy will be spent by the electrons and eventually, they will lose all their energy and will fall into the nucleus so the stability of atom is not explained.</li>
<li>If electrons continuously revolve around the ‘nucleus, the type of spectrum expected is a continuous spectrum. But in reality, what we see is a line spectrum.</li>
</ul>
<p><a id="Subatomic-Particles" name="Subatomic-Particles"></a></p>
<h2><span style="color: #800080;">Subatomic Particles</span></h2>
<h3><span style="color: #800080;">Protons</span></h3>
<ul>
<li>Protons are positively charged subatomic particles. The charge of a proton is 1e, which corresponds to approximately 1.602 × 10<sup>-19</sup></li>
<li>The mass of a proton is approximately 1.672 × 10<sup>-24</sup></li>
<li>Protons are over 1800 times heavier than electrons.</li>
<li>The total number of protons in the atoms of an element is always equal to the atomic number of the element.</li>
</ul>
<h3><span style="color: #800080;">Neutrons</span></h3>
<ul>
<li>The mass of a neutron is almost the same as that of a proton i.e. 1.674×10<sup>-24</sup></li>
<li>Neutrons are electrically neutral particles and carry no charge.</li>
<li>Different isotopes of an element have the same number of protons but vary in the number of neutrons present in their respective nuclei.</li>
</ul>
<h3><span style="color: #800080;">Electrons</span></h3>
<ul>
<li>The charge of an electron is -1e, which approximates to -1.602 × 10<sup>-19</sup></li>
<li>The mass of an electron is approximately 9.1 × 10<sup>-31</sup>.</li>
<li>Due to the relatively negligible mass of electrons, they are ignored when calculating the mass of an atom.</li>
</ul>
<p><a id="Atomic-Structure-of-Isotopes" name="Atomic-Structure-of-Isotopes"></a></p>
<h2><span style="color: #800080;">Atomic Structure of Isotopes</span></h2>
<p>Nucleons are the components of the nucleus of an atom. A nucleon can either be a proton or a neutron. Each element has a unique number of protons in it, which is described by its unique <a href="https://byjus.com/chemistry/atomic-number-mass-number/">atomic number</a>. However, several atomic structures of an element can exist, which differ in the total number of nucleons.</p>
<p>These variants of elements having a different nucleon number (also known as the mass number) are called isotopes of the element. Therefore, the <a href="https://byjus.com/chemistry/isotopes-and-isobars/">isotopes of an element</a> have the same number of protons but differ in the number of neutrons.</p>
<p>The atomic structure of an isotope is described with the help of the chemical symbol of the element, the atomic number of the element, and the mass number of the isotope. For example, there exist three known naturally occurring <a href="https://byjus.com/chemistry/isotopes-of-hydrogen/">isotopes of hydrogen</a>, namely, protium, deuterium, and tritium. The atomic structures of these hydrogen isotopes are illustrated below.</p>
<p>The isotopes of an element vary in stability. The half-lives of isotopes also differ. However, they generally have similar chemical behavior owing to the fact that they hold the same electronic structures</p><h2><span style="color: #800080;">Atomic Structures of Some Elements</span></h2>
<p>The structure of atom of an element can be simply represented via the total number of protons, electrons, and neutrons present in it. The atomic structures of a few elements are illustrated below.</p>
<h3><span style="color: #800080;">Hydrogen</span></h3>
<p>The most abundant isotope of hydrogen on the planet Earth is protium. The atomic number and the mass number of this isotope are 1 and 1 respectively.</p>
<p><strong>Structure of Hydrogen atom:</strong> This implies that it contains one proton, one electron, and no neutrons ( total number of neutrons = mass number – atomic number)</p>
<h3><span style="color: #800080;">Carbon</span></h3>
<p>Carbon has two stable isotopes – 12C and 13C. Of these isotopes, 12C has an abundance of 98.9%. It contains 6 protons, 6 electrons, and 6 neutrons.</p>
<p><strong>Structure of Carbon atom:</strong> The electrons are distributed into two shells and the outermost shell (valence shell) has four electrons. The tetravalency of <a href="https://byjus.com/chemistry/carbon/">carbon</a> enables it to form a variety of chemical bonds with various elements.</p>
<h3><span style="color: #800080;">Oxygen</span></h3>
<p>There exist three stable isotopes of oxygen – 18O, 17O, and 16O. However, oxygen-16 is the most abundant isotope.</p>
<p><strong>Structure of Oxygen atom:</strong> Since the atomic number of this isotope is 8 and the mass number is 16, it consists of 8 protons and 8 neutrons. 6 out of the 8 electrons in an <a href="https://byjus.com/chemistry/oxygen/">oxygen atom</a> lie in the valence shell.<br />
<a id="Bohrs-Atomic-Theory" name="Bohrs-Atomic-Theory"></a></p>
<h2><span style="color: #800080;">Bohr’s Atomic Theory</span></h2>
<p>Neils Bohr put forth his model of the atom in the year 1915. This is the most widely used atomic model to describe the atomic structure of an element which is based on <a href="https://byjus.com/chemistry/planks-quantum-theory/">Planck’s theory of quantization</a>.</p>
<h3><span style="color: #800080;">Postulates:</span></h3>
<ul>
<li>The electrons inside atoms are placed in discrete orbits called “stationery orbits”.</li>
<li>The energy levels of these shells can be represented via quantum numbers.</li>
<li>Electrons can jump to higher levels by absorbing energy and move to lower energy levels by losing or emitting its energy.</li>
<li>As longs as, an electron stays in its own stationery, there will be no absorption or emission of energy.</li>
<li>Electrons revolve around the nucleus in these stationery orbits only.</li>
<li>The energy of the stationary orbits is quantized.</li>
</ul>
<h3><span style="color: #800080;">Limitations of Bohr’s Atomic Theory:</span></h3>
<ul>
<li>Bohr&#8217;s atomic structure works only for single electron species such as H, He+, Li2+, Be3+, ….</li>
<li>When the <a href="https://byjus.com/chemistry/hydrogen-spectrum/">emission spectrum of hydrogen</a> was observed under a more accurate spectrometer, each line spectrum was seen to be a combination of no of smaller discrete lines.</li>
<li>Both Stark and Zeeman effects couldn’t be explain using Bohr’s theory.</li>
</ul>
<p><strong>Heisenberg’s uncertainty principle: </strong>Heisenberg stated that no two conjugate physical quantities can be measured simultaneously with 100% accuracy. These will always be some error or uncertainty in the measurement.</p>
<p><strong>Drawback:</strong> Position and momentum are two such conjugate quantities which were measured accurately by Bohr (theoretically).</p>
<p><strong>Stark effect: </strong>Phenomenon of deflection of electrons in the presence of an electric field.</p>
<p><strong>Zeeman effect: </strong>Phenomenon of deflection of electrons in the presence of a magnetic field.<br />
<a id="Dual-Nature-of-Matter" name="Dual-Nature-of-Matter"></a></p>
<h2><span style="color: #800080;">Dual Nature of Matter</span></h2>
<p>The electrons which were treated to be particles, the evidence of photoelectric effect shows they also have wave nature. This was proved by Thomas young with the help of his <a href="https://byjus.com/jee/youngs-double-slit-experiment/">double slit experiment</a>.</p>
<p>De-Broglie concluded that since nature is symmetrical, so should be light or any other matter wave.</p>
<h3><span style="color: #800080;">Quantum Numbers</span></h3>
<ul>
<li><strong>Principal Quantum number (n): </strong>It denotes the orbital number or shell number of electron.</li>
<li><strong>Azimuthal Quantum numbers (</strong><strong><em>l</em></strong><strong>): </strong>It denotes the orbital (sub-orbit) of the electron.</li>
<li><strong>Magnetic Quantum number: </strong>It denotes the number of energy states in each orbit.</li>
<li><strong>Spin Quantum number(s): </strong>It denotes the direction of spin, S = -½ = Anticlockwise and ½ = Clockwise.</li>
</ul>
<h2><span style="color: #800080;">Electronic Configuration of an Atom</span></h2>
<p>The electrons have to be filled in the s, p, d, f in accordance with the following rule.</p>
<p><strong>1. Aufbau&#8217;s principle: </strong>The filling of electrons should take place in accordance with the ascending order of energy of orbitals:</p>
<ul>
<li>Lower energy orbital should be filled first and higher energy levels.</li>
<li>The energy of orbital <strong>α(p + l) </strong>value it two orbitals have same (n + <em>l</em>) value, E α n</li>
<li>Ascending order of energy 1s, 2s, 2p, 3s, 3p, 4s, 3d, . . .</li>
</ul>
<p><strong>2. Pauli’s exclusion principle: </strong>No two electrons can have all the four <a href="https://byjus.com/chemistry/quantum-numbers/">quantum numbers</a> to be the same or, if two electrons have to placed in an energy state they should be placed with opposite spies.</p>
<p><strong>3. Hund’s rule of maximum multiplicity: </strong>In case of filling degenerate (same energy) orbitals, all the degenerate orbitals have to be singly filled first and then only pairing has to happen.</p>
<p><a id="#Frequently-Asked-Questions" name="Frequently-Asked-Questions"></a></p>
<h2 style="color: #800080;">Frequently Asked Questions On Atomic Structure</h2>
<h3>What are subatomic particles?</h3>
<p>Subatomic particles are the particles that constitute an atom. Generally, this term refers to protons, electrons, and neutrons.</p>
<h3>How do the atomic structures of isotopes vary?</h3>
<p>They vary in terms of the total number of neutrons present in the nucleus of the atom, which is described by their nucleon numbers.</p>
<h3>What are the shortcomings of Bohr’s atomic model?</h3>
<p>According to this atomic model, the structure of atom offers poor spectral predictions for larger atoms. It also failed to explain the Zeeman effect. It could only successfully explain the hydrogen spectrum.</p>
<h3>How can the total number of neutrons in the nucleus of a given isotope be determined?</h3>
<p>The mass number of an isotope is given by the sum of the total number of protons and neutrons in it. The atomic number describes the total number of protons in the nucleus. Therefore, the number of neutrons can be determined by subtracting the atomic number from the mass number.</p>
"""),
          ],
        ),
      ),
    );
  }
}
