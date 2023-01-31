OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[8];
z q[9];
cx q[5], q[1];
z q[0];
cx q[4], q[7];
cx q[7], q[4];
