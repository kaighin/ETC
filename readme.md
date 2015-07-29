Extended Triple Collocation (ETC)
=================================

Extended Triple Collocation (ETC) is a technique for estimating the mean-squared-errors (MSE) and correlation coefficients (rho) of three measurement systems (e.g., satellite, in-situ and model-based products) with respect to the unknown true value of the variable being measured (e.g., soil moisture, wind speed). See McColl et al. (2014) for more details (full reference below).

ETC.m is a Matlab function for implementing ETC.

## FAQ
### Why am I getting negative values for the estimated MSEs and squared correlation coefficients?
This can happen if your sample size is too small, causing the estimated covariance matrix Q_hat to be too noisy. It can also occur if one of the assumptions of ETC is violated (e.g., linear relationship between the measurement and true value, uncorrelated errors between measurements and with the truth).


## Reference
If you publish work that uses this code, please cite:
>McColl, K.A., J. Vogelzang, A.G. Konings, D. Entekhabi, M. Piles, A. Stoffelen (2014). Extended Triple Collocation: Estimating errors and correlation coefficients with respect to an unknown target. Geophysical Research Letters 41:6229-6236
http://onlinelibrary.wiley.com/doi/10.1002/2014GL061322/abstract

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.