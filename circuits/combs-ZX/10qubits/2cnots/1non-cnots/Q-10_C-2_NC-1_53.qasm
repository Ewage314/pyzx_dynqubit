OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[2];
z q[3];
cx q[5], q[8];
