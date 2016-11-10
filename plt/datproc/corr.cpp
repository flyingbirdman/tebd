/*
 * @author: yangkai0208@gmail.com
 * @brief: generator the i file for the fermi simulation,
 * also gives the qsub file in cluster, and also for the
 * post data process
 * @date: 15-Aug-2015
 * @date(revised): 13-Mar-2016
 * @revised: only treat the fourier transformation of the corr function
 */
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <vector>
#include <complex>
#define pi 3.14159265358979

int systemSize;
int measures;
void fortm(std::complex<double> &c_out, std::vector<std::vector<std::complex<double> > > &m_in, double k);
void fermicorfunc(std:: ofstream &out, std::ifstream &in);

int main(int argc, char* argv[]){
  std::ofstream post_out;
  std::ifstream post_in;
  if(argc != 7)
    std::cout << "pls input as '-L size -M measures -in infile'" << std::endl;

  systemSize = std::atof(argv[2]);
  measures = std::atof(argv[4]);
  post_in.open(argv[6]);
  std::string outfile(argv[6]);
  outfile.insert(outfile.size()-4,"_bz");
  post_out.open(outfile.c_str());
  fermicorfunc(post_out, post_in);
  return 1;
}

void fermicorfunc(std:: ofstream &out, std::ifstream &in){
  // corf function init
  std::vector<std::vector<std::complex<double> > > corf(systemSize);
  for(int i=0; i<systemSize; i++)
    corf[i].resize(systemSize);

  std::vector<std::vector<std::pair<double, double> > > post(2);
  for(int i=0; i<post.size(); i++)
    post[i].resize(systemSize+1);
  
  double x; std::complex<double> cij;
  out << "#        Q         real        imag" << std::endl; 
  for(int mi=0; mi<measures; mi++){
    // corf function input
    for(int i=0; i<systemSize; i++)
      for(int j=0; j<systemSize; j++){
        in >> x;
        corf[i][j]=x;
      }
    for(int i=0; i<systemSize; i++)
      for(int j=0; j<systemSize; j++){
        in >> x;
        corf[i][j]+=std::complex<double> (0,x);
      }
    // fourier transformation
    if(mi!=0 && mi!=15)
      for(int i=0; i<systemSize+1; i++){
        x=-pi+pi/(systemSize)*(2.0*i);
        fortm(cij, corf, x);
        out << x << "   " << cij.real() << "   "<< cij.imag() <<std::endl;
      }
    else if(mi == 0)
      for(int i=0; i<systemSize+1; i++){
        x=-pi+pi/(systemSize)*(2.0*i);
        fortm(cij, corf, x);
        post[0][i]=std::pair<double, double> (cij.real(), cij.imag());
        out << x << "   " << cij.real() << "   "<< cij.imag() <<std::endl;
      }
    else if(mi == 15)
      for(int i=0; i<systemSize+1; i++){
        x=-pi+pi/(systemSize)*(2.0*i);
        fortm(cij, corf, x);
        post[1][i]=std::pair<double, double> (cij.real(), cij.imag());
        out << x << "   " << cij.real() << "   "<< cij.imag() <<std::endl;
      }
    out << std::endl << std::endl;
  }
  for(int i=0; i<systemSize+1; i++){
    x=-pi+pi/(systemSize)*(2.0*i);
    out << x << "   " << post[1][i].first-post[0][i].first*post[0][i].first << "   " << 0 << std::endl;
  }
  // close file
  in.close();
  out.close();
}

void fortm(std::complex<double> &c_out, std::vector<std::vector<std::complex<double> > > &m_in, double k){
  if(m_in.size() != m_in[0].size()){
    std::cerr << "fortm: colm and rowm must be same" << std::endl;
    std::exit(1);
  }
  int LL=m_in.size(); std::complex<double> eye(0,1.0);
  c_out=std::complex<double> (0.0, 0.0);
  for(int i=0; i<LL; i++)
    for(int j=0; j<LL; j++)
      c_out += m_in[i][j]*exp(k*(i-j)*eye);
  c_out /= (1.0*(LL));
}
