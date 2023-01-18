OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[5], q[8];
cx q[9], q[3];
x q[0];
cx q[0], q[1];
cx q[7], q[5];
