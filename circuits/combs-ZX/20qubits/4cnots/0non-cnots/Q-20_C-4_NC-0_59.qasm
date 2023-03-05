OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[17], q[13];
cx q[7], q[19];
cx q[19], q[4];
cx q[3], q[2];
