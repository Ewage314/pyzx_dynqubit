OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[0];
cx q[0], q[4];
x q[4];
cx q[5], q[1];
cx q[5], q[4];
cx q[7], q[5];
