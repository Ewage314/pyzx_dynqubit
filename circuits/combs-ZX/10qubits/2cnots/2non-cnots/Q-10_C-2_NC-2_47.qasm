OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[4];
cx q[7], q[3];
z q[0];
cx q[5], q[6];
