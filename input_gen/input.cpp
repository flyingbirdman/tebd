/*
 * @author: yangkai0208@gmail.com
 * @brief: generator the input file for the fermi simulation
 * also gives the qsub file in cluster
 * @date: 15-Aug-2015
 */
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>

// SystemSettings
int systemSize, totNum, trotterOrder;
double  spin;
std::string BoundaryCond;
// FHParams
double jTunn, U0, mu0, V0, t0, t1, omega0, omega1,delta;
// ITPParams
int chiMin, chiMax, stepsForJudge, maxITPsteps;
double  convCriterion1, convCriterion2, dtITP;
std::string itpDir;
// filename
std::string qsubfile_prefix, inputfile_prefix, qsubfile, inputfile;

template <typename T>
std::string ToString(T val)
{
     std::stringstream stream;
     stream << val;
     return stream.str();
}

void input_default();
void input_parameter(int argc, char* argv[]);
void input_gen(std::ofstream &out);
               
int main(int argc, char* argv[]){
  std::ofstream qsub, input;
  inputfile_prefix="f";
  
  input_default();
  input_parameter(argc, argv);
  input_gen(input);
  
  return 1;
}

void input_default(){
  spin=0.5; BoundaryCond="\'O\'"; trotterOrder=5;
  systemSize=40; totNum=39;

  jTunn=1.0; t1=1.0; omega1=1.0;
  U0=4.0; mu0=0.0; V0=0.0; t0=0.0; omega0=0.0; delta=0.0;

  chiMin=25; chiMax=40; convCriterion1=0.00001; convCriterion2=0.000001;
  stepsForJudge=100; dtITP=0.1; maxITPsteps=4000; itpDir="\'ITPDATA/\'";
}

void input_parameter(int argc, char* argv[]){  
  bool L_in, spin_in,totNum_in;
  bool U0_in, mu0_in, V0_in, t0_in, omega0_in, delta_in, omega1_in, t1_in;
  std::string L_s, spin_s,totNum_s;
  std::string U0_s, mu0_s, V0_s, t0_s, omega0_s, delta_s, omega1_s, t1_s;
  L_in=false; spin_in=false; totNum_in=false; U0_in=false; mu0_in=false; V0_in=false;
  t0_in=false; omega0_in=false; delta_in=false; omega1_in=false; t1_in=false;
  if(argc >1)
    for(int i=1; i<argc; i++){
      std::string name(argv[i]);
      if(name=="-L" || name=="-l")
        L_in=true;
      else if(name=="-spin" || name=="-s")
        spin_in=true;
      else if(name=="-n" || name=="-totnum" || name=="-num" || name=="-N")
        totNum_in=true;
      else if(name=="-U" || name=="-u" || name=="-U0" || name=="-u0")
        U0_in=true;
      else if(name=="-mu" || name=="-m" || name=="-mu0")
        mu0_in=true;
      else if(name=="-v" || name=="-v0" || name=="-V" || name=="-V0")
        V0_in=true;
      else if(name=="-t0")
        t0_in=true;
      else if(name=="-omega0")
        omega0_in=true;
      else if(name=="-delta" || name=="-dd")
        delta_in=true;
      else if(name=="-omega1")
        omega1_in=true;
      else if(name=="-t1")
        t1_in=true;
      else{
        if(L_in){
          systemSize=std::atoi(name.c_str());
          L_in=false;
        }else if(spin_in){
          spin=std::atof(name.c_str());
          spin_in=false;        
        }else if(totNum_in){
          totNum=std::atoi(name.c_str());
          totNum_in=false;
        }else if(U0_in){
          U0=std::atof(name.c_str());
          U0_in=false;        
        }else if(mu0_in){
          mu0=std::atof(name.c_str());
          mu0_in=false;
          mu0_s="mu"+ToString(mu0);
        }else if(V0_in){
          V0=std::atof(name.c_str());
          V0_in=false;
          V0_s="V0"+ToString(V0);
        }else if(t0_in){
          t0=std::atof(name.c_str());
          t0_in=false;
        }else if(omega0_in){
          omega0=std::atof(name.c_str());
          omega0_in=false;
        }else if(delta_in){
          delta=std::atof(name.c_str());
          delta_in=false;
        }else if(omega1_in){
          omega1=std::atof(name.c_str());
          omega1_in=false;
          omega1_s="c1"+ToString(omega1);
        }else if(t1_in){
          t1=std::atof(name.c_str());
          t1_in=false;
          t1_s="t1"+ToString(t1);
        }else{
          std::cerr << "prefix problem" << std::endl;
          std::exit(1.0);
        }
      }
    }
  L_s="L"+ToString(systemSize);
  spin_s="S"+ToString(spin)+"_";
  totNum_s="N"+ToString(totNum);
  U0_s="U"+ToString(U0);
  t0_s="t0"+ToString(t0);
  omega0_s="c0"+ToString(omega0);
  delta_s="dd"+ToString(delta);
  inputfile=inputfile_prefix+spin_s+L_s+totNum_s+t1_s+omega1_s+U0_s+V0_s+mu0_s+t0_s+omega0_s+delta_s+".nml";
}

void input_gen(std::ofstream &out){
  out.open(inputfile.c_str());
  out << "&SystemSettings\n";
  out << " systemSize=" << systemSize << ", totNum=" << totNum << ", spin=" << spin << ", BoundaryCond=" << BoundaryCond << ", trotterOrder=" << trotterOrder << std::endl;
  out << "&end\n" << std::endl;

  out << "&FHParams\n";
  out << " jTunn=" << jTunn << ", U0=" << U0 << ", mu0=" << mu0 << ", V0=" << V0 << ", t0=" << t0 << ", t1=" << t1 << ", omega0=" << omega0 << ", omega1=" << omega1 << ", delta=" << delta << std::endl;
  out << "&end\n" << std::endl;

  out << "&ITPParams\n";
  out << " chiMin=" << chiMin << ", chiMax=" << chiMax << ", convCriterion1=" << convCriterion1 << ", convCriterion2=" << convCriterion2 << ", stepsForJudge=" << stepsForJudge << ", dtITP=" << dtITP << ", maxITPsteps=" << maxITPsteps << ", itpDir=" << itpDir << std::endl;
  out << "&end" << std::endl;
  out.close();
}
