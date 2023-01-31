OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
cx q[5], q[3];
cx q[8], q[0];
cx q[1], q[3];
cx q[7], q[6];
