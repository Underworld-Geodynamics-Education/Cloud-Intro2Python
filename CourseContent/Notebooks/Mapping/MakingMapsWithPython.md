
# How to make maps in python

There are a number of packages which you can use to make great looking maps of your data
with python. Two of these which are very popular are [`basemap`](http://matplotlib.org/basemap/) and [`cartopy`](http://scitools.org.uk/cartopy/). My personal
choice (LM) is `cartopy` and that is what we will use in this class.

![Example image](./images/HimalayaS.png)

This is one of the sample maps that we are going to make. It shows the Indian subcontinent and the Himalayan collision zone along with Earthquake data and strain rate data. The "contours" on the left hand map are flow lines of the plate velocity.

In order to make maps like this we have to get very familiar with the cartopy package, we also have to get comfortable with manipulation of the data which is usually stored as 2d arrays / images.

### Structure of the lesson

The first thing we have to do is to make sure we all have copies of all the data. Most of this is open source and available for download on the web. There are some python packages (of course) to help with this and I have put everything into a notebook for you. You have to run this before trying any of the exercises will work. Some of the data I had to download and process a bit beforehand (aka here is one I prepared earlier) and this notebook will make a copy of those files to ensure nothing gets irretrievably broken.

  - <a href="/notebooks/Notebooks/Mapping/0 - Preliminaries.ipynb" target="_blank"> <!--_--> Notebook: Preliminaries </a>

Next we will move on to a simple example to become familiar with the way that cartopy works

  - <a href="/notebooks/Notebooks/Mapping/1 - Introducting Cartopy.ipynb"target="_blank"> <!--_--> Notebook: Starting with Cartopy </a>

Plotting maps is often a matter of wrestling with _map projections_. Cartopy has a full range of projections built in. These can involve significant computation so we may not be able to try all of them. We also introduce the idea of a GeoTIFF which is an image format which also carries some information about the geographical extent of the image - this greatly enhances the transportability and useablility of the images.

  - <a href="/notebooks/Notebooks/Mapping/2 - Images and GeoTIFFs.ipynb"target="_blank"> <!--_ --> Notebook: Images </a>

Now we take some data on magnetic intensity for the Australian continent and use the array manipulation capability of numpy to mask out areas we don't want to see. We then use _cartopy features_ to superimpose this map on a background global map.

  - <a href="/notebooks/Notebooks/Mapping/3 - Working with real data.ipynb"target="_blank"> <!--_--> Notebook: Plotting our downloaded datasets </a>

Some of the datasets we have downloaded (sea floor age, strain rate) are better off as contour maps so that we have control over the colouring, so we can emphasise particular parts of the data range and so that we can show contour lines on top of an image.

  - <a href="/notebooks/Notebooks/Mapping/4 - Contouring Global Data.ipynb"target="_blank"> <!--_--> Notebook: Contour maps  </a>

Some data are scattered clouds of points like the locations of earthquake epicentres. We can plot these data just as we would plot a scatter graph but also in any projection we choose. Also introducing a few pieces of the `obspy` package which grabs the data from the various earthquake databases (and a lot more that we are not going to touch on here).

  - <a href="/notebooks/Notebooks/Mapping/5 - Working with point data.ipynb"target="_blank"> <!--_ --> Notebook: Seismicity / point data </a>

Cartopy has a built in capability to query and download data from the [space shuttle radar topography mission](http://www2.jpl.nasa.gov/srtm/) and plot it. There are other on line services (google maps, for example) which also allow you to download data on the fly. Cartopy has built in support for many of these.

  - <a href="/notebooks/Notebooks/Mapping/6 - Working with Shuttle Radar Topography.ipynb" target="_blank"> <!--_ --> Notebook: Shuttle Radar Topography </a>
  - <a href="/notebooks/Notebooks/Mapping/7 - Working with on-demand mapping services.ipynb" target="_blank"> <!--_ --> Notebook: On-demand mapping services </a>

We downloaded global plate motion vectors in various reference frames. These are vector data (velocity arrows) and can be plotted in various ways

  - <a href="/notebooks/Notebooks/Mapping/8 - Global Plate Motions ++ .ipynb" target="_blank"> <!--_ --> Notebook: Plate motion vectors </a>

Finally, we take pieces of all these examples and build the map above.

  - <a href="/notebooks/Notebooks/Mapping/9 - Himalaya region maps and images.ipynb" target="_blank"> <!--_ --> Notebook: Himalayan region </a>

(You can read the article it came from in [SIAM news](https://sinews.siam.org/DetailsPage/tabid/607/ArticleID/685/Computational-Plate-Tectonics-and-the-Geological-Record-in-the-Continents.aspx) and see some other cartopy maps)


---


### Help me !!

   * [Louis Moresi's Home Page](http://www.moresi.info)
   * [email Louis Moresi](mailto:Louis.Moresi@unimelb.edu.au)
   * [`cartopy` home page](http://scitools.org.uk/cartopy/)
   * [`basemap` home page](http://matplotlib.org/basemap/)
