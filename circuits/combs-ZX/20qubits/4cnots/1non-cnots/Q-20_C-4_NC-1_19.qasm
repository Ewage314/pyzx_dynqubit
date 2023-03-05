OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[18], q[6];
x q[9];
cx q[4], q[14];
cx q[8], q[19];
cx q[7], q[1];
