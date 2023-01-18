OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[8], q[4];
x q[8];
cx q[4], q[6];
cx q[8], q[0];
x q[6];
cx q[7], q[1];
