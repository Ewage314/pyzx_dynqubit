OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
z q[1];
cx q[1], q[0];
cx q[7], q[4];
cx q[6], q[0];
cx q[8], q[0];
cx q[5], q[6];
