import MDAnalysis as mda
import maicos
import matplotlib.pyplot as plt

u = mda.Universe('dump.04.lammpstrj', topology_format='LAMMPSDUMP')
grp_Na = u.select_atoms('type 3')
grp_Cl = u.select_atoms('type 4')

dplanCl = maicos.DensityPlanar(grp_Cl)
dplanCl.run()

zcoorCl = dplanCl.results['z']
densCl = dplanCl.results['dens_mean']

dplanNa = maicos.DensityPlanar(grp_Na)
dplanNa.run()

zcoorNa = dplanNa.results['z']
densNa = dplanNa.results['dens_mean']

plt.plot(zcoorCl, densCl)
plt.plot(zcoorNa, densNa)

plt.show()

