Extended Triple Collocation (ETC)
=================================

Extended Triple Collocation (ETC) is a technique for estimating the variance of the noise error (errVar) and correlation coefficients (rho) of three measurement systems (e.g., satellite, in-situ and model-based products) with respect to the unknown true value of the variable being measured (e.g., soil moisture, wind speed). See McColl et al. (2014) for more details (full reference below).

ETC.m is a Matlab function for implementing ETC.

## FAQ
### Do I need to apply ETC to anomalies?
There is no requirement to do this. ETC works fine on both absolute values or climatological anomalies. However, there is some evidence to suggest that for the specific case of soil moisture, anomalies may better satisfy the assumptions of triple collocation (Miralles et al. 2010; Draper et al. 2013)
>Miralles, Diego G., Wade T. Crow, and Michael H. Cosh (2010). Estimating Spatial Sampling Errors in Coarse-Scale Soil Moisture Estimates Derived from Point-Scale Observations. Journal of Hydrometeorology 11, no. 6

>Draper, Clara, Rolf Reichle, Richard de Jeu, Vahid Naeimi, Robert Parinussa, and Wolfgang Wagner (2013). Estimating Root Mean Square Errors in Remotely Sensed Soil Moisture over Continental Scale Domains. Remote Sensing of Environment 137

### Do I need to rescale my data to a reference before applying ETC?
While some studies rescale each measurement system to a "reference" system, there is no need to do this; in fact, it biases the error estimates and should be avoided (see Yilmaz & Crow, 2013 for more on this: http://journals.ametsoc.org/doi/abs/10.1175/JHM-D-12-052.1). You should just apply ETC directly to the data without rescaling.

### Why am I getting negative values for the estimated errVars and squared correlation coefficients?
This can happen if your sample size is too small, causing the estimated covariance matrix Q_hat to be too noisy. It can also occur if one of the assumptions of ETC is violated (e.g., linear relationship between the measurement and true value, uncorrelated errors between measurements and with the truth).


## Reference
If you publish work that uses this code, please cite:
>McColl, K.A., J. Vogelzang, A.G. Konings, D. Entekhabi, M. Piles, A. Stoffelen (2014). Extended Triple Collocation: Estimating errors and correlation coefficients with respect to an unknown target. Geophysical Research Letters 41:6229-6236
http://onlinelibrary.wiley.com/doi/10.1002/2014GL061322/abstract

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.