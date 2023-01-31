OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[8];
cx q[9], q[5];
cx q[7], q[2];
cx q[8], q[3];
cx q[5], q[1];
