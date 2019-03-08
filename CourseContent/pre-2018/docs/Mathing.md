
# How to tame mathematics using python

The purpose of learning programming is to allow you to conduct repetitive tasks on your data quickly and efficiently. We learned to write loops to allow the computer to do most of the work. Our job is to identify the patterns that the computer needs to execute to do what we need it to do.

In this section, we are going to use this concept of repetitive action to solve complicated mathematical problems. To do this, what we are going to have to understand is that many of the equations we work with actually identify the patterns and so are quite easy to understand. The hard part is to understand how the patterns play out.

### Example (Radioactive decay)

For example, this is a simple differential equation which describes the rate of radioactive decay as a function of time:

\begin{equation}
    \frac{d\theta}{dt} = - k \theta
    \label{eq:decay}
\end{equation}

This is the equation which governs radioactive decay, in which case
$\theta$ is the amount of the radioactive isotope remaining and $d\theta /  dt$
is the activity that we can measure. $k$ is closely related to the half life.

The solution to this equation is
\begin{equation}
        \theta(t) = \theta_0 e^{-kt}
        \label{eq:decaysolution}
\end{equation}

where $\theta_0$ is the amount of the radioactive material remaining.
The same equation also describes the cooling of, say, a cup of coffee. In this
case we interpret $\theta$ as the excess temperature (above room temperature).

**We can prove that this is a solution to the equation by substituting the solution $(\ref{eq:decaysolution})$ into the original equation $(\ref{eq:decay}$)**

### Think Again !

If we go back to the original equation ($\ref{eq:decay}$ ), instead of thinking of this as a mathematical expression that needs to be solved, consider it instead as a description of what the physical thing is doing.

_The number of radioactive decays which occur at any time (which is also the amount of the material $\theta$ we lose each time) is proportional to the amount of $\theta$ that we have left._

We can look for a pattern here: if we know what the value of $\theta $ is at some time, $t$, then we know how fast it is changing. A short time later there is less of $\theta $ and we know how much less because the rate of change tells us.

As long as we have some place to start, we can work forwards (or backwards, actually) in time to see what will happen a short time later, and from there, forward again _(and again, and again ... )_ ** This is a perfect opportunity to explore the problem using a loop to march forwards in time**.

This is what we do in the first notebook:

   - <a href="/notebooks/Notebooks/SolveMathProblems/0 - IntroductionToNumericalSolutions.ipynb" target="_blank"> <!--_ --> Notebook: Radioactive Decay </a>

### Groundwater flow equation

The decay equation is very simple and probably very familiar. It is an _ordinary differential equation_ which just means that it relates the rate of change in a quantity to a function of that quantity or just the quantity itself.

The equation which governs the pressure evolution in an aquifer is a little bit more complicated because it relates the rate of change (time) of pressure to the gradient (in space) of the pressure. This is called a _partial differential equation_.

\begin{equation}
    S\frac{\partial h}{\partial t} + H = K  \frac{\partial^2 h}{\partial x^2}
    \label{eq:gwflow}
\end{equation}

Where $h$ is the hydraulic pressure, $H$ is a source term (e.g pumped in fluid via a well), and $K$ is a constant coefficient related to the geometry of the pore space, the properties of the fluid and so on.

It is not part of this course to worry about finding analytic solutions ( i.e. an expression that starts $h = \ldots$ ). But we can just think about what the expression means - _how does the pressure at one point change in time ?_

Again, we can see that the rate of change of pressure, $h$ in time is related to the second gradient of the pressure in space. If we know the pressure everywhere at a time, $t$, we can also calculate how it changes everywhere. We can update the pressure to find out the value everywhere and see what it is like a short time later.  **Now we have two loops, one nested within the other which allow us to calculate the pressure at every time**

Of course, when we change the pressure at one point, this influences the neighbours because the gradients change. This could get quite complicated but it is just book-keeping really and computer programs are brilliant at doing this sort of thing without making mistakes.

This is what we do in the second notebook:

   - <a href="/notebooks/Notebooks/SolveMathProblems/1 - GroundwaterFlow-LectureNotes.ipynb" target="_blank"> <!--_ --> Notebook: Groundwater flow problem </a>

### Advanced Topic: Heat flow equation & Application

The heat flow equation is the same as the groundwater flow equation. In the next example we will consider what happens when we move from 1D to 2D and what happens if the thermal properties are different.

It also introduces a name: _finite differences_ which is the formal description of what we have been discussing already.

- <a href="/notebooks/Notebooks/SolveMathProblems/2 - FiniteDifferences.ipynb" target="_blank"> <!--_ --> Notebook: Finite Differences </a>
- <a href="/notebooks/Notebooks/SolveMathProblems/3 - AdvancedFiniteDifferences.ipynb" target="_blank"> <!--_ --> Notebook: Advanced / Applied Finite Differences </a>

---

## Help me !!

   * [Louis Moresi's Home Page](http://www.moresi.info)
   * [email Louis Moresi](mailto:Louis.Moresi@unimelb.edu.au)
