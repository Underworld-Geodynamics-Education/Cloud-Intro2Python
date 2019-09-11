# Building meshes using the `stripy` package

When you have a collection of point data, you probably would like to be able to do things like
interpolate that data to points that lie between the ones that were measured, or perhaps, make
a smooth approximately-interpolating surface that respects those measurements. One step towards
this is to 'triangulate' the points. This requires joining up the points in the *best* triangulation
that is available and being able to navigate around the mesh to find neighbours of individual points,
and which triangle a particular point lies in.

If you want to understand more about the idea of a *best* triangulation, it is worth reading
something about **Delaunay Triangulations** and **Voronoi Diagrams**. This is what `stripy` computes
for you.

`stripy` is a collection of tools for making triangulated meshes on the flat plane and
on the sphere. While both of these are useful, the ability to mesh the spherical
Earth is extremely handy for handling geographic data. The meshes also allow interpolation,
smoothing and finding gradients.

NOTE: These examples use some of the [mapping](MakingMapsWithPython.md) and [plotting](Plotting.md) tools which
you need to be comfortable with beforehand.

These examples are divided into three folders:

## Cartesian Triangulations

These are all examples in the flat plane and show how to use the triangulation library to build, plot and smooth information.
   The worked example is heat flow data for Victoria: a region small enough that we don't worry about the spherical Earth.

   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex1-Cartesian-Triangulations.ipynb" target="_blank"> <!--_-->  Getting Started </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex2-CartesianGrids.ipynb" target="_blank"> <!--_--> Gridding </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex3-Interpolation.ipynb" target="_blank"> <!--_--> Interpolation routines </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex4-Gradients.ipynb" target="_blank"> <!--_--> Derivatives  </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex5-Smoothing.ipynb" target="_blank"> <!--_--> Spline smoothing </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex6-Scattered-Data.ipynb" target="_blank"> <!--_--> Managing point data </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/CartesianTriangulations/Ex7-Refinement-of-Triangulations.ipynb" target="_blank"> <!--_--> Triangulation refinements </a>

## Spherical Triangulations

These examples track the above planar cases but use the spherical version of the library. The worked example is for Earthquake frequency around the globe which is better handled as a spherical triangulation.

   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex1-Spherical-Triangulations.ipynb" target="_blank"> <!--_-->  Getting Started </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex2-SphericalGrids.ipynb" target="_blank"> <!--_--> Getting started with spherical triangulations </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex3-Interpolation.ipynb" target="_blank"> <!--_--> Interpolating data on the sphere </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex4-Gradients.ipynb" target="_blank"> <!--_--> Gradients of quantities on the surface of the sphere </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex5-Smoothing.ipynb" target="_blank"> <!--_--> Spline smoothing on the sphere </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex6-Scattered-Data.ipynb" target="_blank"> <!--_--> Point data </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/SphericalTriangulations/Ex7-Refinement-of-Triangulations.ipynb" target="_blank"> <!--_--> Refining spherical triangulations </a>

## Litho 1.0

The litho 1.0 dataset is a compilation of crustal / geological data and surface wave data that define a global Earth structure model for the lithosphere. The data comes in the form of an icosahedral triangulation which is horrible to work with ... unless you have `stripy` !! (*)

   - <a href="/notebooks/Notebooks/SphericalMeshing/Litho1pt0/Ex1-Litho1Layers.ipynb" target="_blank"> <!--_--> Access Litho 1.0 data </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/Litho1pt0/Ex2-Litho1Properties.ipynb" target="_blank"> <!--_--> Extracting data </a>
   - <a href="/notebooks/Notebooks/SphericalMeshing/Litho1pt0/Ex3-CrustalRegionalisation.ipynb" target="_blank"> <!--_--> Using Crust 1.0 </a>


(*) FYI - I wrote the stripy library for exactly this reason ...
