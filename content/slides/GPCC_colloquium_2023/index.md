---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "GPCC_colloquium_2023"
summary: ""
authors: []
tags: []
categories: []
date: 2023-07-07T23:47:42+10:00
slides:
  # Choose a theme from https://github.com/hakimel/reveal.js#theming
  theme: black
  # Choose a code highlighting style (if highlighting enabled in `params.toml`)
  #   Light style: github. Dark style: dracula (default).
  #   Available highlight themes listed in: https://highlightjs.org/static/demo/
  #   Use lower case names and replace space with hyphen '-'
  highlight_style: dracula

  diagram: true
  diagram_options:
    # Mermaid diagram themes include: default,base,dark,neutral,forest
    theme: base

  # RevealJS slide options.
  # Options are named using the snake case equivalent of those in the RevealJS docs.
  reveal_options:
    controls: true
    progress: true
    slide_number: c/t  # true | false | h.v | h/v | c | c/t
    center: true
    rtl: false
    mouse_wheel: true
    transition: fade  # none/fade/slide/convex/concave/zoom
    transitionSpeed: default  # default/fast/slow
    background_transition: slide  # none/fade/slide/convex/concave/zoom
    touch: true
    loop: false
    menu_enabled: true
---

<link rel="stylesheet" href="reveal_custom.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/jpswalsh/academicons@1/css/academicons.min.css">

<div class="vert-banner">
  
  <img src="img/UNSW_logo-portrait-light_transparent.png">
  <img src="img/Udash logo CMYK revised-03.png">

</div>

<script>
  function add_vert_banner() {
    let vertbanner = document.querySelector("div.vert-banner");
    let reveal = document.querySelector(".reveal");
    reveal.insertBefore(vertbanner, reveal.firstChild);
  }
  
  window.onload = add_vert_banner();
</script>

## Rainfall Estimates on a Gridded Network (REGEN)

Steefan Contractor

<br/>

<div class="citation"">Contractor, S., Donat, M. G., Alexander, L. V., Ziese, M., Meyer-Christoffer, A., Schneider, U., Rustemeier, E., Becker, A., Durre, I., and Vose, R. S.: Rainfall Estimates on a Gridded Network (REGEN) – a global land-based gridded dataset of daily precipitation from 1950 to 2016, Hydrol. Earth Syst. Sci., 24, 919–943<div>

---

# Basic description

- Daily estimates over 1950 - 2016 
- Gridded 1 degree latitude x 1 degree longitude resolution
- Global land coverage

---

# Purpose

- Purpose built for climate studies with a long temporal record and consistent global spatial analysis
- Based on a large in situ archive from combining GPCC with GHCN-Daily among others
- Includes various statistical model error estimates
- Also includes guidance for users less aware of issues with in situ based precipitation observations

---

# In Situ Station Archive Description

<div class="multi-column">

<div class="col2">
<br/><br/>

- Total stations: 135,178
- Around 50K stations for each day
- Min stations per day: 35,460
- Max stations per day: 56,190

</div>

<div class="col3">

  <img src="img/num_stations_by_source.jpg" width="300px">
  <img src="img/station_locations.jpg">

</div>

---

# Component In Situ Archives

<div class="multi-column" style="font-size: 60%;">

<div class="col1">

##### Three sources:

- GPCC stations
- GHCN-Daily stations
- Collected during GEWEX workshops

</div>

<div class="col1">

##### Merging algorithm:

- Lat + Lon match and
- World Met. Org. (WMO) ID match or missing

Or

- Coordinates within 1º of each other and
- WMO ID match or missing and
- 0.99 correlation between timeseries with 365 days of data of which at least 10d with >1mm precip

</div>

---

<div style="font-size:70%">

# Quality Control Procedures

- The automated QC procedures were identical to those applied to GHCN-Daily (Durre et al. 2010)
- The procedure included two stages
- Stage 1 does temporal checks
  - multi-day accumulations
  - duplicate data within timeseries
  - frequent occurance of values
  - world record exceedances
  - outlier checks
  - temporal consistency checks
- Stage 2 does spatial checks
  - checks whether values are consistent with negihbours

</div>

<br/>

<div class="citation">Durre, I., Menne, M. J., Gleason, B. E., Houston, T. G., and Vose, R. S.: Comprehensive automated quality assurance of daily sur- face observations, J. Appl. Meteorol. Clim., 49, 1615–1633</div>

---

<div style="font-size: 50%;">

# Interpolation Algorithm

- Ordinary Block Kirging
- Best Linear Unbiassed Estimator (BLUE)
- Linear because the estimate is a weighted average of surrounding stations

$$\mathbf{Z}^*(s_0) = \sum_{i=0}^{N} λ_i\mathbf{Z}(S_i)$$

- Best because we use the spatial structure (covariance) to determine the value of the weights
- Unbiassed because the weights are constrained to add up to 1 and so the result cannot be biassed to any one station

$$\sum_{i=1}^N λ = 1$$

- Ordinary Kriging assumes second order stationarity (mean and variance constant across domain)

$$\mathbf{Z}^*(s_0) = μ + ε(s_0)$$

- Block implies that the algorithm produces gridded area-average estimates as opposed to point estimates

</div>

---

# Two Flavours: All stations and Long Term Stations Only

- The All stations based dataset interpolates all underlying stations
- The Long Term version interpolates only stations with 40 complete years of data
- A year is complete if all 12 months had at least 70% non-missing days

---

# Uncertainty aware guidance for users

<div class="multi-column">

<div class="col1" style="font-size: 90%">
<br/>

- The uncertainty info includes Kriging Error (KE): a weighted average of modeled variance (between interpolation location and stations) and depends solely on the spatial distribution of stations and grid size, and
- Yamamoto coefficient of variation (CV) (Yamamoto et al. 2000): weighted (by Kriging weights) average error between the estimate and the station values
- Number of stations used for each grid estimate is also included

</div>

<div class="col1">

<img src="img/REGEN_AvgKriginError.jpg" width=90%>
<img src="img/REGEN_CV.jpg" width=90%>

</div>

</div>

<div class="citation">Yamamoto, J. K.: An Alternative Measure of the Reliability of Ordinary Kriging Estimates, Math. Geol., 32, 489–509</div>

---

# Quality Masks

<p style="text-align: left;">A grid cell was left unmasked if:

- It contained 60% of days in every decade with at least 1 station, and 
- both the KE and CV were under the 95th percentile (spatial distribution) of the temporally averaged (over 1950 - 2016) KE and CV respectively

<img src="img/REGEN_REGEN40_qualitymasks.jpg">

---

# Comparison with other global gridded datasets of monthly precipitation

<img src="img/AnnualPrcpTotAnomalyTS_REGEN_GPCC_GHCN_CRU.png" width=80%>

---

# Comparison with other global gridded datasets of daily precipitation

<img src="img/REGENvsGPCCFDDandCPC.jpg" width=75%>

---
<div class="top">

# Comparison with regional daily precipitation datasets
<div class="multi-column">

<div class="col1">

Mean difference

</div>

<div class="col1">

SD of difference

</div>

<div class="col1">

Temporal correlation

</div>

</div>

<div id="imgfrag">
{{< fragment >}}<img src="img/REGENvsCPCCONUS.jpg">{{< /fragment >}}
{{< fragment >}}<img src="img/REGENvsEOBS.jpg">{{< /fragment >}}
{{< fragment >}}<img src="img/REGENvsAWAP.jpg">{{< /fragment >}}
{{< fragment >}}<img src="img/REGENvsAPHRODITE.jpg">{{< /fragment >}}
{{< fragment >}}<img src="img/REGENvsSAOBS.jpg">{{< /fragment >}}
</div>
</div>

---

# Application: Global changes in precipitation

<div class="multi-column">

<div class="col1">

Trends in annual precipitation (1950 - 2016) (mm/yr)

<img src="img/trends.jpg" width=100%>

<div class="citation">Contractor, S., Donat, M. G., & Alexander, L. V. (2021). Changes in Observed Daily Precipitation over Global Land Areas since 1950. Journal of Climate, 34(1), 3–19.</div>

</div>

<div class="col1">

<p style="font-size: 50%">Wet-day frequency changes between 1950-1983 and 1984-2016 (%)

<img src="img/frequency_changes.jpg" width=80%>

<p style="font-size: 50%">Mean precipitation intensity changes between 1950-1983 and 1984-2016 (%)

<img src="img/intensity_changes.jpg" width=80%>

</div>

</div>

---

# Changes across the precipitation distribution between 1950-1983 and 1984-2016

<div class="multi-column">

<div class="col1">

- Spatially, changes in precipitation seem complex, even stochastic at first
- But a clear signal of positive precipitation changes in the high quantiles consitent with thermodynamic expectations is apparent
- This signal dissappears for the most extreme precipitation again

</div>

<div class="col1">

<p style="font-size: 50%">Relative difference in area showing postive changes vs area showing negative changes

<img src="img/distribution_changes.jpg">

</div>

</div>

---

# Synchronous changes between frequency and intensity

<div class="multi-column">

<div class="col1">

- Mean changes in frequency and intensity are aligned in only around 1/3<sup>rd</sup> of the grids
- Extreme changes in frequency and intensity are aligned in almost 80% of areas globally

</div>

<div class="col1">

<img src="img/freqchanges_vs_intchanges.jpg">

</div>

</div>

---

# (My ideal) Future of climate datasets

<div style="font-size:80%">

- All "observational" datasets are estimates from a statistical model consisting of aleatoric and epistemic uncertainties
- If we stop thinking of observations as immutable facts and instead think of them as data generating models than we can ask more meaningful questions
- E.g. for validation studies, instead of doing a grid cell by grid cell comparison we can calculate the conditional probability of the model output given the observations
- To do this we need observations to be inherently probabilistic (the entire distribution), e.g. Risser et al. 2019
- Artificial intelligence assisted inference can alleviate computational bottlenecks that traditionally made inference algorithms impractical in climate sciences, e.g. Zammit-Mangion et. al 2021 and Lenzi et. al 2023
- As the examples demonstrate even a dataset of extremes is possible with this approach
</div>
<br/>
<div class="citation">Risser, M. D., Paciorek, C. J., Wehner, M. F., O’Brien, T. A., & Collins, W. D. (2019). A probabilistic gridded product for daily precipitation extremes over the United States. Climate Dynamics, 53(5), 2517–2538.</div>
<div class="citation">Zammit-Mangion, A., Ng, T. L. J., Vu, Q., & Filippone, M. (2021). Deep Compositional Spatial Models. Journal of the American Statistical Association, 0(0), 1–47.</div>
<div class="citation">Lenzi, A., Bessac, J., Rudi, J., & Stein, M. L. (2023). Neural networks for parameter estimation in intractable models. Computational Statistics & Data Analysis, 185, 107762.</div>

---

# Thank you

<img style="border-radius:50%" src="https://s.gravatar.com/avatar/f5f75fa059f22f822b95edc56c68930873203f6816d9d0864a75d82b2453e52f?s=250">
<br/>

<a href="mailto:s.contractor@unsw.edu.au" aria-label="envelope">
            <i class="fas fa-envelope big-icon"></i>
</a>

<a href="https://twitter.com/stefancontracto" target="_blank" rel="noopener" aria-label="twitter">
            <i class="fab fa-twitter big-icon"></i>
</a>

<a href="https://scholar.google.co.uk/citations?user=sEnHZ3AAAAAJ" target="_blank" rel="noopener" aria-label="google-scholar">
            <i class="ai ai-google-scholar big-icon"></i>
          </a>

<a href="https://github.com/steefancontractor" target="_blank" rel="noopener" aria-label="github">
            <i class="fab fa-github big-icon"></i>
          </a>

<a href="https://www.linkedin.com/in/steefan-contractor-b375bb209/" target="_blank" rel="noopener" aria-label="linkedin">
            <i class="fab fa-linkedin big-icon"></i>
          </a>

<a href="https://mastodon.au/@stefancontracto" target="_blank" rel="noopener" aria-label="mastodon">
            <i class="fab fa-mastodon big-icon"></i>
          </a>