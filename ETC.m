function [errVar_ETC, rho2_ETC] = ETC(y)
% ETC.m
%
% Extended Triple Collocation (ETC) is a technique for estimating the
% variance of the noise error (errVar) and correlation coefficients (rho) of three
% measurement systems (e.g., satellite, in-situ and model-based products)
% with respect to the unknown true value of the variable being measured 
% (e.g., soil moisture, wind speed).
%
% INPUTS
% y: an N x 3 matrix of temporally- and spatially-collocated observations 
% from the three measurement systems, where N is the sample size. This 
% must be the same for each measurement system. All NaNs must be removed.
%
% OUTPUTS
% errVar_ETC: a 3 x 1 vector of errVars of each of the measurement systems with
% respect to the uknown true value of the variable being measured. The ith
% row corresponds to the measurement system with observations in the ith
% column of y.
% rho2_ETC: a 3 x 1 vector of squared correlation coefficients.
% 
% REFERENCE
% For more details on ETC, see:
%
% McColl, K.A., J. Vogelzang, A.G. Konings, D. Entekhabi, M. Piles, A.
% Stoffelen (2014). Extended Triple Collocation: Estimating errors and 
% correlation coefficients with respect to an unknown target. Geophysical 
% Research Letters 41:6229-6236
%
% If you use ETC, please cite this paper where appropriate.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Author: Kaighin McColl
% Date: September 14, 2014

    % Catch errors in inputs
    if size(y,2) ~= 3
        error('Error: Input data y must be an N x 3 matrix');
    end
    
    if any(isnan(y(:)))
        error('Error: Input data y must not contain NaNs');
    end
    
    if length(unique(y(:,1))) == 1 || length(unique(y(:,2))) == 1 || length(unique(y(:,3))) == 1 
        error('Error: the sample variance of each of the columns of y must be non-zero. Increase your sample size or reconsider using ETC.');
    end
    
    % Estimate covariance matrix of the three measurement systems
    Q_hat = cov(y);

    rho_ETC = [sqrt(Q_hat(1,2)*Q_hat(1,3)/Q_hat(1,1)/Q_hat(2,3)); ...
        sign(Q_hat(1,3)*Q_hat(2,3))*sqrt(Q_hat(1,2)*Q_hat(2,3)/Q_hat(2,2)/Q_hat(1,3)); ...
        sign(Q_hat(1,2)*Q_hat(2,3))*sqrt(Q_hat(1,3)*Q_hat(2,3)/Q_hat(3,3)/Q_hat(1,2))];

    rho2_ETC = rho_ETC.^2;
    
    errVar_ETC = [(Q_hat(1,1) - Q_hat(1,2)*Q_hat(1,3)/Q_hat(2,3)); ...
        (Q_hat(2,2) - Q_hat(1,2)*Q_hat(2,3)/Q_hat(1,3)); ...
        (Q_hat(3,3) - Q_hat(1,3)*Q_hat(2,3)/Q_hat(1,2))];

    
    % If errVars are negative, display a warning.
    if any(errVar_ETC<0)
        warning('Warning: at least one calculated errVar is negative. This can happen if the sample size is too small, or if one of the assumptions of ETC is violated.');
    end
    % If squared correlation coefficients are negative, display a warning. 
    if any(rho2_ETC<0)
        warning('Warning: at least one calculated squared correlation coefficient is negative. This can happen if the sample size is too small, or if one of the assumptions of ETC is violated.');
    end
    
end

