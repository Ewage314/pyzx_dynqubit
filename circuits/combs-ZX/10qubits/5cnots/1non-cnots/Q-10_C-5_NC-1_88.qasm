OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[1];
cx q[7], q[1];
cx q[3], q[7];
cx q[8], q[6];
z q[0];
cx q[1], q[4];
